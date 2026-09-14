#!/bin/bash
# Locale tracker for Omarchy-ru-locale
# Polls key GitHub points for maintainer activity

set -euo pipefail

STATE_DIR="${HOME}/.local/share/locale-ru"
mkdir -p "$STATE_DIR"
STATE_FILE="$STATE_DIR/state.json"
SNAP_FILE="$STATE_DIR/site-locales.txt"

POINTS=(
  "omacom/omarchy|7284|issue"
  "sbelcl/omarchy-language|1|pr"
  "omacom/omarchy|11139|issue"
  "omacom/omarchy|11308|issue"
  "omacom/omarchy|8765|issue"
  "omacom/omarchy|10955|issue"
)

notify() {
  local title="$1"
  local body="$2"
  notify-send -u normal -i dialog-information "$title" "$body" 2>/dev/null || true
  echo "[$title] $body"
}

get_last_comment() {
  local repo="$1"
  local num="$2"
  local type="$3"
  local api_path="repos/$repo/issues/$num/comments"
  if [ "$type" = "pr" ]; then
    api_path="repos/$repo/pulls/$num/comments"
  fi
  gh api "$api_path" --jq '.[-1] | (.created_at + " " + .user.login)' 2>/dev/null || echo ""
}

main() {
  local changed=0
  declare -A old
  if [ -f "$STATE_FILE" ]; then
    while IFS= read -r line; do
      key=$(echo "$line" | cut -d' ' -f1)
      val=$(echo "$line" | cut -d' ' -f2-)
      old["$key"]="$val"
    done < <(jq -r 'to_entries[] | "\(.key) \(.value.updated) \(.value.comments)"' "$STATE_FILE" 2>/dev/null || true)
  fi

  echo "{" > "$STATE_FILE.tmp"
  local first=1
  for p in "${POINTS[@]}"; do
    IFS='|' read -r repo num type <<< "$p"
    key="$repo#$num"
    last=$(get_last_comment "$repo" "$num" "$type")
    [ -z "$last" ] && last="none"

    if [ -n "${old[$key]:-}" ] && [ "${old[$key]}" != "$last" ]; then
      notify "Omarchy locale: активность" "$key обновлено: $last"
      changed=1
    fi

    if [ $first -eq 0 ]; then echo "," >> "$STATE_FILE.tmp"; fi
    first=0
    echo "  \"$key\": {\"state\": \"open\", \"comments\": 0, \"updated\": \"$last\"}" >> "$STATE_FILE.tmp"
  done
  echo "}" >> "$STATE_FILE.tmp"
  mv "$STATE_FILE.tmp" "$STATE_FILE"

  # Snapshot site locales
  gh api repos/omacom/omarchy-site/contents/src/data/site-locales.txt --jq '.content' 2>/dev/null | base64 -d > "$SNAP_FILE" 2>/dev/null || true

  if [ $changed -eq 0 ]; then
    echo "Нет новых комментариев от мейнтейнеров."
  fi
}

main "$@"
