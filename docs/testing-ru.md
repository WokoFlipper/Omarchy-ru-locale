# Тесты DNS в России (терминал, по шагам)

## 0. Подготовка
```bash
# Тунель ВКЛ (без него половина провайдеров заглушена)
pgrep -x karing || (setsid karing >/dev/null 2>&1 < /dev/null & sleep 4; pgrep -x karing)
# Текущее состояние
omarchy dns
cat /usr/local/share/omarchy-dns/provider /usr/local/share/omarchy-dns/protocol
```

## 1. Быстрая карта DoT (без смены системы, ~2 мин)
```bash
python3 /tmp/opencode/dotprobe.py   # базовые 13
python3 /tmp/opencode/dotprobe2.py  # новые 6
# UP + ok = жив; DOWN = разбираем отдельно
```

## 2. Переключение провайдеров (каждый — polkit-диалог, подтвердить)
```bash
for p in NextDNS DNS4EU OpenDNS Quad9 AdGuard Mullvad CleanBrowsing AliDNS Yandex; do
  echo "=== $p ==="
  omarchy-dns $p && resolvectl query example.com | head -n 1
done
# Ожидаем: везде резолв, провайдер в файле совпадает
cat /usr/local/share/omarchy-dns/provider
```

## 3. Протоколы (движок DoH/DoQ)
```bash
omarchy-dns NextDNS DoH   # toml nextdns, http3=false
grep -E "server_names|^http3" /etc/dnscrypt-proxy/wifi-dns.toml
resolvectl query example.com | head -n 1
omarchy-dns NextDNS DoQ   # http3=true
grep "^http3 " /etc/dnscrypt-proxy/wifi-dns.toml
journalctl -u wifi-dns-proxy.service --no-pager -n 3 | tail -n 3
omarchy-dns NextDNS       # назад на DoT
```

## 4. Панель (глазами)
- `SUPER+CTRL+W` → кнопки, тоглы DoT/DoH/DoQ, тултипы
- Тап по средней кнопке циклирует DNS (тултип показывает следующий)
- ⚠Яндекс с красным тултипом
- Шапка: замер `100mbit` (кнопка меряет сама, ~24 сек)

## 5. Возврат в исходное
```bash
omarchy-dns DHCP
omarchy dns
```

## Что фиксировать
- Провайдер/протокол, UP/DOWN, задержку, текст ошибок
- Скрины панели при визуальных багах
