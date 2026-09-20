# Omarchy-ru-locale

Русская локализация для [Omarchy](https://github.com/omacom/omarchy).

Russian localization for [Omarchy](https://github.com/omacom/omarchy).

## Содержимое / Contents

- `translations/ru_RU.tsv` — переводы пунктов меню (137 строк, применяются через Language-плагин, 335 строк живо)
- `translations/bindings-ru.tsv` — переводы описаний стандартных биндов Omarchy (204 записи, без личных; локально НЕ применяются — конфликтуют с биндами)
- `translations/wifi-ru.tsv` — подписи панели сети/Wi-Fi (10 строк, без DNS-зоны — протокольные слова)
- `po/omarchy-shell.po` — переводы для omarchy-shell (177 строк, превью)
- `po/omarchy-cli.po` — переводы для omarchy-cli (61 строка, превью)
- `track.sh` — скрипт для отслеживания активности в связанных PR и issues (6 системных точек; сайт закрыт)
- `bindings-translate` — генератор блока русских описаний биндов (статус/применение/откат)
- `systemd/locale-track.*` — юниты таймера для track.sh (раз в час)
- `SUBMITTING.md` — пошаговая инструкция по отправке
- `docs/site-decisions.md` — решения по вычитке сайта (#251)

- `translations/ru_RU.tsv` — menu item translations (137 lines, applied via Language plugin, 335 lines live)
- `translations/bindings-ru.tsv` — translations of default Omarchy binding descriptions (204 entries, no personal ones; do NOT apply locally — they conflict with bindings)
- `translations/wifi-ru.tsv` — network/Wi-Fi panel labels (10 lines, DNS area excluded — protocol words)
- `po/omarchy-shell.po` — translations for omarchy-shell (177 lines, preview)
- `po/omarchy-cli.po` — translations for omarchy-cli (61 lines, preview)
- `track.sh` — script for tracking activity in related PRs and issues (6 system endpoints; site closed)
- `bindings-translate` — generator for the Russian bindings block (status/apply/remove)
- `systemd/locale-track.*` — timer units for track.sh (hourly)
- `SUBMITTING.md` — step-by-step submission guide
- `docs/site-decisions.md` — site proofreading decisions (#251)

> Shell/CLI-переводы — превью: рантайм не выбран (#8765 против #10051), ставить в систему пока нечего.
>
> Shell/CLI translations are a preview: runtime not chosen yet (#8765 vs #10051), nothing to install into the system for now.

## Установка / применение / Installation

1. Клонировать этот репозиторий / Clone this repository
2. Для меню: строки из ru_RU.tsv применяются через форк omarchy-language (jsonc-оверрайд целыми строками) / For menus: lines from ru_RU.tsv are applied via omarchy-language fork (whole-line jsonc override)
3. Для биндов: bindings-ru.tsv — только архив/справка, локально не применять / For bindings: bindings-ru.tsv is archive/reference only, do not apply locally
4. Для shell/cli: превью до выбора рантайма (#8765); проверка — `msgfmt --check po/*.po` / For shell/cli: preview until runtime is chosen (#8765); check with `msgfmt --check po/*.po`

## Опасные бинды: почему 4 описания переводить нельзя / Dangerous binds

Четыре webapp-бинда с `focus = true` передают своё **описание** в
`omarchy-launch-or-focus-webapp` как строку поиска окна:

```
SUPER+SHIFT+S → omarchy-launch-or-focus-webapp "Google Maps" "https://maps.google.com/"
```

Перевод `Google Maps → Google Карты` ломает не подпись, а **поведение**:
вкладка браузера по-прежнему называется Google Maps, совпадение не находится,
и вместо фокуса каждый раз открывается лишний дубль. Затронуты:
`WhatsApp`, `Google Messages`, `Google Photos`, `Google Maps`.
Остальные описания (Календарь, YouTube и т.д.) передают только URL — их
перевод меняет лишь текст в шпаргалке. Детали и аудит — в
`WEBAPP-BIND-AUDIT.md`; разблокировка — после ветки linyiru с `opts.id`
(omacom/omarchy#12404).

Four webapp binds with `focus = true` pass their **description** to
`omarchy-launch-or-focus-webapp` as the window match string. Translating e.g.
`Google Maps → Google Карты` breaks **behaviour**, not display: the browser
tab is still called Google Maps, no match is found, and a duplicate opens
instead of focusing. Affected: `WhatsApp`, `Google Messages`, `Google Photos`,
`Google Maps`. Other descriptions only change cheatsheet text. Details in
`WEBAPP-BIND-AUDIT.md`; unblocked once linyiru's `opts.id` branch lands
(omacom/omarchy#12404).

## Отслеживание / Tracking

Запусти `track.sh` или настрой systemd timer для уведомлений о новых комментариях мейнтейнеров.

Run `track.sh` or set up a systemd timer to get notified about new maintainer comments.

## Связанные PR и issues / Related PRs and issues

См. track.sh для списка отслеживаемых. / See track.sh for the tracked list.

## Лицензия / License

MIT (как основной проект) / MIT (same as upstream)
