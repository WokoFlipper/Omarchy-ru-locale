#!/bin/bash
# RU DNS tests: tunnel + DoT matrix + switching. Run in terminal, no agent needed.
set -u
PASS=0; FAIL=0
say() { printf '\n=== %s ===\n' "$1"; }

say "0. Tunnel"
pgrep -x karing >/dev/null || { setsid karing >/dev/null 2>&1 < /dev/null & sleep 4; }
pgrep -x karing >/dev/null && echo "tunnel: UP" || { echo "tunnel: DOWN — start Karing first"; exit 1; }
echo "current: $(omarchy dns 2>/dev/null | head -n 1)"

say "1. DoT matrix (live queries, port 853)"
python3 - <<'EOF'
import socket, ssl, struct, time
def q(n='example.com'):
    h=struct.pack('>HHHHHH',0x1234,0x0100,1,0,0,0)
    return h+b''.join(bytes([len(p)])+p.encode() for p in n.split('.'))+b'\x00'+struct.pack('>HH',1,1)
def probe(ip,sni,to=8):
    m=struct.pack('>H',len(q()))+q(); t0=time.time()
    try:
        r=socket.create_connection((ip,853),timeout=to)
        c=ssl.create_default_context(); c.check_hostname=False; c.verify_mode=ssl.CERT_NONE
        s=c.wrap_socket(r,server_hostname=sni); s.settimeout(to); s.sendall(m)
        ln=s.recv(2)
        if len(ln)<2: return (False,0,'short')
        (n,)=struct.unpack('>H',ln); d=b''
        while len(d)<n:
            ch=s.recv(n-len(d))
            if not ch: break
            d+=ch
        s.close(); dt=(time.time()-t0)*1000
        ok=len(d)>=12 and (d[2]&0x80) and ((d[3]&0x0F)==0)
        return (ok,dt,'ok' if ok else 'bad')
    except Exception as e: return (False,0,type(e).__name__)
T=[("1.1.1.1","cloudflare-dns.com","Cloudflare"),("8.8.8.8","dns.google","Google"),
("9.9.9.9","dns.quad9.net","Quad9"),("45.90.28.0","dns.nextdns.io","NextDNS"),
("86.54.11.100","unfiltered.joindns4.eu","DNS4EU"),("208.67.222.222","dns.opendns.com","OpenDNS"),
("94.140.14.14","dns.adguard-dns.com","AdGuard"),("194.242.2.2","dns.mullvad.net","Mullvad"),
("185.228.168.9","security-filter-dns.cleanbrowsing.org","CleanBrowsing"),
("223.5.5.5","dns.alidns.com","AliDNS"),("76.76.2.11","dns.controld.com","ControlD"),
("1.12.12.12","dot.pub","DNSPod"),("77.88.8.8","common.dot.dns.yandex.net","Yandex")]
up=down=0
for ip,sni,name in T:
    ok,ms,info=probe(ip,sni)
    print(f"{'UP  ' if ok else 'DOWN'} {ms:7.0f}ms {name:14s} {ip:15s} {info}")
    up,down=(up+1,down) if ok else (up,down+1)
print(f"TOTAL: {up} up / {down} down")
EOF

say "2. Panel switching (confirm each polkit dialog!)"
for p in NextDNS DNS4EU OpenDNS Quad9 AdGuard Mullvad CleanBrowsing Yandex; do
  printf '%-14s: ' "$p"
  if omarchy-dns "$p" >/dev/null 2>&1; then
    if resolvectl query example.com >/dev/null 2>&1; then echo "OK"; PASS=$((PASS+1));
    else echo "NO-RESOLVE"; FAIL=$((FAIL+1)); fi
  else echo "SWITCH-FAIL"; FAIL=$((FAIL+1)); fi
done

say "3. Protocols (NextDNS)"
omarchy-dns NextDNS DoH >/dev/null 2>&1 && grep -q "http3 = false" /etc/dnscrypt-proxy/wifi-dns.toml && resolvectl query example.com >/dev/null 2>&1 && echo "DoH: OK" && PASS=$((PASS+1)) || { echo "DoH: FAIL"; FAIL=$((FAIL+1)); }
omarchy-dns NextDNS DoQ >/dev/null 2>&1 && grep -q "http3 = true" /etc/dnscrypt-proxy/wifi-dns.toml && resolvectl query example.com >/dev/null 2>&1 && echo "DoQ: OK" && PASS=$((PASS+1)) || { echo "DoQ: FAIL"; FAIL=$((FAIL+1)); }

say "4. Restore"
omarchy-dns DHCP >/dev/null 2>&1; echo "dns now: $(omarchy dns 2>/dev/null | head -n 1)"

say "RESULT: pass=$PASS fail=$FAIL"
