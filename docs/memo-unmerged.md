# Memo: unmerged (2026-09-19)

Archive: ~/backups/unmerged-2026-09-19.tar.gz (clones + local plugins).

## Awaiting sbelcl's merge (his repo)
- #3 Direct Boot label (branch direct-boot-fix) — pinged.
- #7 brightness % (branch brightness-pct, +FIXED BRIGHTNESS short).
- #8 audio % (branch audio-pct, carries #7 lines — rebase if #7 lands first).
- weather#1 wind m/s (from OUR fork WokoFlipper/omarchy-weather-l10n:wind-ms; no write access to his weather fork).

## Local-only (not upstreamable as-is)
- resty.weather: rebased on current stock + m/s + 3 RU labels. Freeze fixed
  (was missing setCenterHoverRevealSuppressed branch).
- resty.charge: published in marketplace ✅ (do not touch).
- DNS DNS4EU swap: backups ready, reapply.sh needs terminal password.

## Open upstream threads
- Wind #11139 (nudged ×2 + blunt), dates #10955, picker #10949, runtime #8765,
  adjudication #12345, bindings schema #12404, DNS guard #12395, kbd #12400.
- #12361/#12362/#12363 (linyiru) backed where relevant.
