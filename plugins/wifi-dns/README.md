# wifi-dns — Wi-Fi + DNS (worldwide)

## Why

Stock pills (Cloudflare, Google) are throttled or unavailable in several regions. This fork ships working presets everywhere — NextDNS (45.90.28.0, DoT), DNS4EU (86.54.11.100), OpenDNS + Custom — and refreshes widget state after a DNS switch (stock sticks on "no connection").

## Changes vs stock `omarchy.network`

1. `dnsProviders`: `[DHCP, NextDNS, DNS4EU, OpenDNS, Custom]` (was: DHCP, Cloudflare, Google, Custom).
2. Pill tooltips + `root.refresh()` after a DNS switch (`onExited`).
3. Everything else is stock.

## Install

```bash
./install.sh
```

Restart the shell: `omarchy-restart-shell`. Every DNS switch goes through
the polkit agent auth dialog (each click).

**On sudo: prompt-only switching.** Each pill click shows an auth dialog via
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
