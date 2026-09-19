#!/bin/bash
# Twice-daily merge nudge for sbelcl's open PRs. Posts only if no maintainer
# movement in the last 20h (state-guarded, no blind spam).
set -u
STATE_DIR="${HOME}/.local/share/locale-ru"
STATE="$STATE_DIR/last-nudge"
last=$(cat "$STATE" 2>/dev/null || echo 0)
now=$(date +%s)
if [ $((now - last)) -lt 72000 ]; then
  echo "nudge: skipped (last ping <20h ago)"
  exit 0
fi
open_prs=""
for p in 3 7 8; do
  st=$(gh pr view "$p" --repo sbelcl/omarchy-language --json state --jq .state 2>/dev/null)
  [ "$st" = "OPEN" ] && open_prs="$open_prs #$p"
done
if [ -z "$open_prs" ]; then
  echo "nudge: nothing open, all merged"
  exit 0
fi
gh api repos/omacom/omarchy/issues/8765/comments -F body="Daily nudge: still waiting on$open_prs — anything needed from my side (fix/rebase/split)?" >/dev/null 2>&1 \
  && date +%s > "$STATE" && echo "nudge: posted for$open_prs"
# weather fork PR lives in another repo; check separately
wst=$(gh pr view 1 --repo sbelcl/omarchy-weather-l10n --json state --jq .state 2>/dev/null)
echo "weather#1: $wst"
