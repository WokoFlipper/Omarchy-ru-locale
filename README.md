# Omarchy-ru-locale

Русская локализация для [Omarchy](https://github.com/omacom/omarchy).

Russian localization for [Omarchy](https://github.com/omacom/omarchy).

## Содержимое / Contents

- `translations/ru_RU.tsv` — переводы пунктов меню (30 строк, применяются через Language-плагин, 335 строк живо)
- `translations/bindings-ru.tsv` — переводы описаний стандартных биндов Omarchy (204 записи, без личных; локально НЕ применяются — конфликтуют с биндами)
- `po/omarchy-shell.po` — переводы для omarchy-shell (177 строк, превью)
- `po/omarchy-cli.po` — переводы для omarchy-cli (61 строка, превью)
- `track.sh` — скрипт для отслеживания активности в связанных PR и issues (8 точек)

- `translations/ru_RU.tsv` — menu item translations (30 lines, applied via Language plugin, 335 lines live)
- `translations/bindings-ru.tsv` — translations of default Omarchy binding descriptions (204 entries, no personal ones; do NOT apply locally — they conflict with bindings)
- `po/omarchy-shell.po` — translations for omarchy-shell (177 lines, preview)
- `po/omarchy-cli.po` — translations for omarchy-cli (61 lines, preview)
- `track.sh` — script for tracking activity in related PRs and issues (8 endpoints)

> Shell/CLI-переводы — превью: рантайм не выбран (#8765 против #10051), ставить в систему пока нечего.
>
> Shell/CLI translations are a preview: runtime not chosen yet (#8765 vs #10051), nothing to install into the system for now.

## Установка / применение / Installation

1. Клонировать этот репозиторий / Clone this repository
2. Для меню: строки из ru_RU.tsv применяются через форк omarchy-language (jsonc-оверрайд целыми строками) / For menus: lines from ru_RU.tsv are applied via omarchy-language fork (whole-line jsonc override)
3. Для биндов: bindings-ru.tsv — только архив/справка, локально не применять / For bindings: bindings-ru.tsv is archive/reference only, do not apply locally
4. Для shell/cli: превью до выбора рантайма (#8765); проверка — `msgfmt --check po/*.po` / For shell/cli: preview until runtime is chosen (#8765); check with `msgfmt --check po/*.po`

## Отслеживание / Tracking

Запусти `track.sh` или настрой systemd timer для уведомлений о новых комментариях мейнтейнеров.

Run `track.sh` or set up a systemd timer to get notified about new maintainer comments.

## Связанные PR и issues / Related PRs and issues

См. track.sh для списка отслеживаемых. / See track.sh for the tracked list.

## Лицензия / License

MIT (как основной проект) / MIT (same as upstream)
