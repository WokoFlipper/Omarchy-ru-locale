# Живой русский трей (2026-09-20): полное описание

Всё ниже — ЖИВОЕ (`~/.config/omarchy/`), не превью. Сток (`/usr/share/omarchy/`)
обновления не трогают `~/.config`, но сток может уйти вперёд (фриз как с
`setCenterHoverRevealSuppressed`) — на это есть снапшоты и reapply.

## Что переведено живьём

| Слот бара | Живой плагин | Источник строк |
|---|---|---|
| меню | сток + `translations/ru_RU.tsv` (137, `menu-translate apply`) | наш репо |
| часы | `sbelcl.clock` (форк sbelcl) | `locales/ru.json` (179) |
| питание % | `sbelcl.power` (форк) + `resty.charge` (свой виджет лимита) | каталог / native RU |
| звук | `sbelcl.audio` (форк) | каталог |
| bluetooth | `sbelcl.bluetooth` (форк) | каталог + `translations/bt-ru.tsv` (28, справочно) |
| сеть/Wi-Fi | `resty.network` (наш форк, 58 строк) | `translations/wifi-ru.tsv` (58) |
| монитор | `sbelcl.monitor` (форк) | каталог |
| агенты | `sbelcl.agents` (форк) | каталог |
| трей | `sbelcl.tray` (форк) | каталог |
| индикаторы | `sbelcl.indicators` (форк) | каталог |
| обновления | `sbelcl.system-update` (форк) | каталог |
| погода | `resty.weather` (свой форк: m/s без гейта + вшитый русский + дни из локали) | вшито (НЕ каталог!) |
| нотификации | `resty.notifications` (твик: 30с critical, иконка 72) + 1 строка RU | вшито |
| раскладка, воркспейсы | сток | строк нет (коды/цифры) — перевод не нужен |

Форки sbelcl: клоны в `~/git/omarchy-*-l10n`, апстрим — его GitHub.
Наши форки (`resty.network`, погода): только живьём + бэкапы, в гите их нет
(исключение: погода-ветка `wind-ms` в нашем форке — ДРУГОЙ подход: гейт по ru
+ каталог; живой вариант — без гейта + хардкод).

## Каталог

`~/.config/omarchy/locales/ru.json` — **179 ключей** (источник: `locales/ru.json`
репо). 20.09 обновлён с 63 (старый `~/backups/ru.json-live-63keys-*`).
Пилюли DNS (DHCP/Quad9/dns0.eu/OpenDNS/Custom) и значения (`"auto"`,
`provider === "Custom"`) — НЕ переводятся никогда (#12344).

## Восстановление

- Погода: `bash ~/backups/resty-weather/reapply.sh` (+ патч, tarball).
- Весь трей: `bash ~/backups/tray-l10n/reapply-tray.sh` (снапшот 11 плагинов + ru.json; проверен `OK` 20.09).
- Авто: хук `~/.config/omarchy/hooks/post-update.d/huawei-charge-selfheal.hook`,
  секции 3 (погода) и 4 (трей). Сам не падает, шлёт нотификации.
- После любого восстановления: `omarchy-restart-shell`.
- `shell.json`: слоты `resty.*`/`sbelcl.*` вместо `omarchy.*`; бэкапы `~/backups/shell.json-before-*`.
- Обновление форков до НОВЫХ версий sbelcl — вручную: `git pull` в `~/git/omarchy-*-l10n`
  → redeploy → re-snapshot (reapply льёт ЗАМОРОЖЕННЫЙ снапшот, не fresh-clone!).

## Проверки

- `diff -rq <stock> <live>` — только ожидаемые файлы.
- Пилюли/значения целы, `nmcli` счёт совпадает.
- После рестарта: `journalctl --user --since "1 minute ago"` без QML-ошибок наших плагинов.
