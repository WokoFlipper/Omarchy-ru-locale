#!/bin/bash
# Remove resty.wifi-dns-ru, keep a timestamped backup. Stock omarchy.network returns.
set -u
DST="$HOME/.config/omarchy/plugins/resty.wifi-dns-ru"
if [[ -d $DST ]]; then
  BK="$DST.removed.$(date +%Y%m%d-%H%M%S)"
  echo "Removing $DST -> backup $BK"
  mv "$DST" "$BK"
else
  echo "Not installed: $DST"
fi
echo "Restart the shell: omarchy-restart-shell"
