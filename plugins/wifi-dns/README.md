# wifi-dns 2.0 — Wi-Fi + DNS (worldwide)

## Why

Stock buttons (Cloudflare, Google) are throttled or unavailable in several regions. This fork ships working presets everywhere — and refreshes widget state after a DNS switch (stock sticks on "no connection").

## v2.0: buttons × protocols

Five buttons: DHCP and Custom are fixed; the middle three cycle DNS providers
on tap (DoT default):

- globals: Cloudflare (1.1.1.1) → Google (8.8.8.8)
- private: NextDNS (45.90.28.0) → DNS4EU (86.54.11.100)
- alternates: OpenDNS (208.67.222.222) → Quad9 (9.9.9.9)

A protocol toggle (DoT / DoH / DoQ) sits above the buttons: DoT is live,
DoH/DoQ are UI-ready and land with the proxy engine next.

## Changes vs stock `omarchy.network`

1. `dnsProviders`: 5 buttons — `[DHCP, ring(globals), ring(private), ring(alternates), Custom]` (was: DHCP, Cloudflare, Google, Custom).
2. Button tooltips + `root.refresh()` after a DNS switch (`onExited`).
3. Everything else is stock.

## Install

```bash
./install.sh
```

Restart the shell: `omarchy-restart-shell`. Every DNS switch goes through
the polkit agent auth dialog (each click).

**On sudo: prompt-only switching.** Each button click shows an auth dialog via
the polkit agent. There is deliberately no silent (password) mode: silent DNS
switching by any local process is a hole. Details in `SECURITY.md`.

## Remove

```bash
./remove.sh
```

Keeps a timestamped backup; stock `omarchy.network` returns.

## Restore

```bash
./restore.sh
```

Re-installs from this repo if missing (update hook).
