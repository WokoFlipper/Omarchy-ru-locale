#!/bin/bash
# Install resty.network into ~/.config/omarchy/plugins/. User-level, no root.
set -u
SRC="$(cd "$(dirname "$0")" && pwd)"
DST="$HOME/.config/omarchy/plugins/resty.network"
if [[ -d $DST ]]; then
  BK="$DST.bak.$(date +%Y%m%d-%H%M%S)"
  echo "Backing up existing plugin -> $BK"
  mv "$DST" "$BK"
fi
mkdir -p "$DST"
install -m 644 "$SRC/manifest.json" "$SRC/Model.js" "$SRC/Panel.qml" "$DST/"
echo "Installed resty.network. Restart the shell: omarchy-restart-shell"
