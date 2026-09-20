# Webapp-bind audit (linyiru pilot, omacom/omarchy#12404)

## Verdict

Neither translation archive contains **any** keybinding descriptions —
`locales/ru.json` (both repos) and `archive/ru-part2-draft.json` cover only
general UI strings. The dangerous window-matcher binds are **not** translated,
so current Russian catalogs cannot break window focus. No action needed on
existing files.

## The 4 dangerous binds (description == window match string)

Source: `/usr/share/omarchy/default/hypr/bindings/applications.lua`.
Each passes its `description` to `omarchy-launch-or-focus-webapp` as the
window match string (`o.launch_webapp_sole`, `helpers.lua:126-127`).
Translating any of these four descriptions changes **behaviour** (which
window gets focused), not just display:

| Key | Description (do NOT translate yet) | URL |
|---|---|---|
| SUPER + SHIFT + ALT + G | `WhatsApp` | https://web.whatsapp.com/ |
| SUPER + SHIFT + CTRL + G | `Google Messages` | https://messages.google.com/web/conversations |
| SUPER + SHIFT + P | `Google Photos` | https://photos.google.com/ |
| SUPER + SHIFT + S | `Google Maps` | https://maps.google.com/ |

Other webapp binds (ChatGPT, Grok, Calendar, Email, New email, YouTube, X,
X Post) pass only the URL — translating their descriptions is display-only
and safe.

## Rule for future bind-description catalogs

Exclude the four descriptions above until linyiru's `opts.id` branch lands
(id defaulting to description, cache keyed on id, explicit ids on these four
binds). After that, match on `opts.id` and translate freely.

Checked: 2026-09-20. Method: grep of both `ru.json` files + draft archive
for all 13 webapp descriptions — zero hits.

## Resolution (2026-09-20): translations/bindings-ru.tsv

The local `translations/bindings-ru.tsv` (204 rows) **did** contain 3 of the 4
dangerous translations (`Google Сообщения`, `Google Фото`, `Google Карты`;
WhatsApp was never translated). Additionally the table was keyed by **key
combo** while `bindings-translate` looks up by **English description** — so
as written, zero TSV rows ever applied (only hardcoded loops emitted).

Fixed:
1. `migrate-tsv.py` (one-shot, in /tmp — not committed) converted the table
   to `EN description → RU`: 204 rows → 148 mappings, 0 conflicts.
2. The 3 dangerous rows were **dropped** (original kept as
   `bindings-ru.tsv.bak-keys`).
3. The 44 unmapped rows are all `code:` loop binds already covered by the
   script's hardcoded loops — nothing lost.
4. `bindings-translate` gained a `DANGEROUS_DESCS` guard: the 4 binds are
   skipped with a stderr warning even if re-added to the table.
5. Dry-run verified (no live config touched): 148 entries, 179 default
   binds parsed, **157 would translate**, all 4 dangerous skipped.

`bindings-translate apply` was deliberately NOT run — the user applies it
themselves when ready.
