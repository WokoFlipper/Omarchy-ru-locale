# Omarchy-ru-locale

Русская локализация для [Omarchy](https://github.com/omacom/omarchy).

## Содержимое

- `translations/ru_RU.tsv` — переводы пунктов меню
- `po/omarchy-shell.po` — переводы для omarchy-shell
- `po/omarchy-cli.po` — переводы для omarchy-cli (OSD, обновления и т.д.)
- `track.sh` — скрипт для отслеживания активности в связанных PR и issues

## Установка / применение

1. Клонировать этот репозиторий
2. Запускать соответствующие скрипты перевода (menu-translate, и т.п.)
3. Копировать сгенерированные файлы в `~/.config/omarchy/`

## Отслеживание

Запусти `track.sh` или настрой systemd timer для уведомлений о новых комментариях мейнтейнеров.

## Связанные PR и issues

См. track.sh для списка отслеживаемых.

## Лицензия

MIT (как основной проект)
