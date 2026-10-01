#!/bin/bash
# Install wifi-dns-ru into ~/.config/omarchy/plugins/. User-level, no root.
set -u
SRC="$(cd "$(dirname "$0")" && pwd)"
DST="$HOME/.config/omarchy/plugins/wifi-dns-ru"
if [[ -d $DST ]]; then
  # Backups must live OUTSIDE plugins/: the shell loads every subdir,
  # and a .bak copy registers a conflicting handler for the same target.
  BK="$HOME/.cache/omarchy-plugin-backups/wifi-dns-ru.bak.$(date +%Y%m%d-%H%M%S)"
  echo "Backing up existing plugin -> $BK"
  mkdir -p "$(dirname "$BK")"
  mv "$DST" "$BK"
fi
mkdir -p "$DST"
install -m 644 "$SRC/manifest.json" "$SRC/Model.js" "$SRC/Panel.qml" "$DST/"
echo "Installed wifi-dns-ru. Restart the shell: omarchy-restart-shell"
