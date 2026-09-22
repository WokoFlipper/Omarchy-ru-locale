#!/bin/bash
# Restore hook: re-install resty.network from this repo if missing.
# ~/.config survives updates, so this normally no-ops. Run manually or from
# a post-update hook: ~/.config/omarchy/hooks/post-update.d/resty-network.hook
set -u
SRC="$(cd "$(dirname "$0")" && pwd)"
DST="$HOME/.config/omarchy/plugins/resty.network"
for f in manifest.json Model.js Panel.qml; do
  if [[ ! -f $DST/$f ]]; then
    echo "Missing $f — reinstalling plugin"
    exec "$SRC/install.sh"
  fi
done
echo "resty.network intact."
