# Omarchy-ru-locale

Русская локализация для [Omarchy](https://github.com/omacom/omarchy).

## Содержимое

- `translations/ru_RU.tsv` — переводы пунктов меню
- `translations/bindings-ru.tsv` — переводы описаний стандартных биндов Omarchy (206 записей, без личных)
- `po/omarchy-shell.po` — переводы для omarchy-shell
- `po/omarchy-cli.po` — переводы для omarchy-cli (OSD, обновления и т.д.)
- `track.sh` — скрипт для отслеживания активности в связанных PR и issues

## Установка / применение

1. Клонировать этот репозиторий
2. Для меню: использовать menu-translate с ru_RU.tsv
3. Для биндов: использовать bindings-translate с bindings-ru.tsv (только стандартные Omarchy бинды)
4. Для shell/cli: msgfmt и установка po-файлов
5. Копировать результат в `~/.config/omarchy/` или `~/.config/hypr/`

## Отслеживание

Запусти `track.sh` или настрой systemd timer для уведомлений о новых комментариях мейнтейнеров.

## Связанные PR и issues

См. track.sh для списка отслеживаемых.

## Лицензия

MIT (как основной проект)
