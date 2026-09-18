# Submitting the Russian locale for Omarchy — step-by-step

This pack contains three independent parts that follow the split
explained in `omacom/omarchy#7284`:

- `ru_RU.tsv` — the Omarchy menu (works today, no framework needed)
- `omarchy-shell.po` — shell UI strings, domain `omarchy.shell` (targets PR #8765)
- `omarchy-cli.po` — interactive `bin/*` script strings, domain `omarchy.cli` (targets PR #8765)

File layout in this directory:

```
omarchy-ru/
  translations/ru_RU.tsv   # copy of /tmp/opencode/ru_RU.tsv
  po/omarchy-shell.po
  po/omarchy-cli.po
```

## 1. Menu translation (works today)

Upstream reference: `sbelcl/omarchy-language`, script `menu-translate`,
tables in `translations/*.tsv` (`English<TAB>translation`, keyed by the
English string, `#` = comment). The generator copies each default row
wholesale from `/usr/share/omarchy/default/omarchy/omarchy-menu.jsonc`
and only swaps `label`/`title`, keeping the English text in `description`
so it stays searchable.

Why wholesale: `parseMenuJsonc` normalizes every entry to a full object
with empty-string defaults *before* merging, so a label-only override
such as `{"label": "Сеть"}` silently drops the row's icon and action.
Never submit label-only rows.

To submit:

1. Fork `https://github.com/sbelcl/omarchy-language`.
2. Copy your table to `translations/ru_RU.tsv` (exact name: locale
   without codeset, `ru_RU`, not `ru_RU.UTF-8`).
3. Run `./menu-translate apply ru_RU.UTF-8`, then
   `./menu-translate status` — expect `state=on`.
4. Open the menu, search both `network` and `сеть` — the row must be
   found, carry its icon, and run its action.
5. After every Omarchy update re-run `apply` — the block records
   `source=<hash>` of the defaults file and `status` reports `stale`
   once upstream moves.
6. Open a PR adding only `translations/ru_RU.tsv`, describing coverage
   (e.g. 136 keys) and that untranslated product names (Steam, Docker,
   Tailscale) intentionally stay English.

## 2. Shell + CLI catalogs (blocked on runtime choice)

PR #8765 proposes a JS `I18n` primitive with language packs as plugins
(catalogs keyed by domain, gettext PO in a community repo). Issue #10051
argues for Qt's own `QTranslator` instead. Until a runtime is picked a
`ru` pack has nothing stable to target — do NOT present these `.po`
files as landing now. Submit them as a *preview* attached to #8765 (or
to the prototype repo `xavivars/omal10n-poc`).

Conventions used here, matching every other locale in the system:

- gettext header with `Language: ru_RU`, `charset=UTF-8`, and the
  standard Russian plural rule:
  `nplurals=3; plural=(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2);`
- `Domain: omarchy.shell` for QML, `Domain: omarchy.cli` for `bin/*`.
- `msgid` is the exact upstream English string including format
  placeholders (`%1`, `N`); never reword it.
- Keep brand names and command names untranslated.

Validate before sending:

```bash
msgfmt --check po/omarchy-shell.po -o /dev/null
msgfmt --check po/omarchy-cli.po -o /dev/null
```

## 3. Dates are a separate bug, not translation

`Qt.formatDate()/Qt.formatDateTime()` render day/month names through the
C locale whatever `LANG` says, so Russian day/month names stay English.
PR #10955 fixes that in four lines
(`date.toLocaleString(Qt.locale(), format)` in `clock/BarWidget.qml`,
`clock/Panel.qml`, `weather/Panel.qml`). Back that PR independently —
it needs no framework and must not be bundled with this locale.

## 4. Website/manual is a separate repo

Russian docs belong to `omacom/omarchy-site` under `src/i18n/`
(one directory per locale plus `src/i18n/locales.json`, currently 31
locales, no `ru`; each language builds separately via
`PUBLIC_SITE_LOCALE` with its own domain). Open that PR there, not here.

---

## Cover letter (paste into the PR / issue)

Title: `Russian locale: menu table + shell/CLI catalog previews`

Body:

> This contributes a Russian locale in three parts, following the split
> in #7284.
>
> 1. `translations/ru_RU.tsv` — full menu table (137 keys, reviewed by a
>    native speaker). Works today via `menu-translate apply ru_RU.UTF-8`;
>    rows are copied wholesale so icons/actions survive the merge, and
>    English stays in `description` for search. Product names
>    intentionally stay English.
> 2. `po/omarchy-shell.po` (domain `omarchy.shell`) and
>    `po/omarchy-cli.po` (domain `omarchy.cli`) — preview catalogs for
>    the #8765 primitive, using standard gettext headers and the Russian
>    `nplurals=3` rule. Submitted as a preview only: per #10051 the
>    runtime (JS primitive vs `QTranslator`) is still undecided.
> 3. Out of scope on purpose: the #10955 date fix and the
>    `omarchy-site` `ru` docs — both are separate PRs.
>
> Validation: `msgfmt --check` passes on both `.po` files;
> `menu-translate status` reports `state=on` with icons/actions intact.
