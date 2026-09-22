# Переименование resty.network → resty.wifi-dns-ru («Wi-Fi + DNS RU»)

## Затронутые места (проверить все до применения)
1. `manifest.json`: id, name, displayName, description.
2. `install.sh` / `remove.sh` / `restore.sh`: пути `~/.config/omarchy/plugins/resty.network`.
3. Бар-конфиг / ссылки на id `resty.network` (поиск перед переименованием!).
4. Живая машина: `~/.config/omarchy/plugins/resty.network/` → переименовать + рестарт шелла.
5. Репо: `locale-ru/plugins/resty.network/` → `plugins/resty.wifi-dns-ru/`;
   отдельный репо + заявка #8078 (тексты).

## Порядок (безопасный)
1. Поиск ссылок на id.
2. Правки файлов (репо + копии).
3. Живая машина: переименование каталога + правка бар-конфига (если ссылается).
4. Рестарт шелла, проверка виджета + переключения DNS.
5. Коммиты, пуши (по правилу — только с «да»), правка заявки.
