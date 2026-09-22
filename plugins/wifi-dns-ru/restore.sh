#!/bin/bash
# Restore hook: re-install wifi-dns-ru from this repo if missing.
# ~/.config survives updates, so this normally no-ops. Run manually or from
# a post-update hook: ~/.config/omarchy/hooks/post-update.d/resty-network.hook
set -u
SRC="$(cd "$(dirname "$0")" && pwd)"
DST="$HOME/.config/omarchy/plugins/wifi-dns-ru"
for f in manifest.json Model.js Panel.qml; do
  if [[ ! -f $DST/$f ]]; then
    echo "Missing $f — reinstalling plugin"
    exec "$SRC/install.sh"
  fi
done
echo "wifi-dns-ru intact."
