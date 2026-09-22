# id-map draft: window-matcher rows → stable ids (НЕ ПРИМЕНЯТЬ)

Черновик на день, когда решится форма (`{ id }` vs `focus = `) в PR #12557.
До решения — архив, генератор эти 4 бинда скипает (DANGEROUS_DESCS).

Источник строк: `translations/bindings-ru.tsv.bak-keys` (KEY-keyed, до миграции).

| chord | EN desc (stock) | stable id (ветка #12557) | архивный RU | статус |
|---|---|---|---|---|
| SUPER + SHIFT + ALT + G | WhatsApp | `WhatsApp` | — (не переводился никогда) | держать латиницей (факт языка) |
| SUPER + SHIFT + CTRL + G | Google Messages | `Google Messages` | Google Сообщения | вернуть в таблицу под id |
| SUPER + SHIFT + P | Google Photos | `Google Photos` | Google Фото | вернуть в таблицу под id |
| SUPER + SHIFT + S | Google Maps | `Google Maps` | Google Карты | вернуть в таблицу под id |

## Запланированное изменение генератора (день решения)

1. `DANGEROUS_DESCS` («не эти 4 лейбла») → `DANGEROUS_IDS` («не эти 4 id»).
2. Эмиссия матчер-строк: `o.bind(keys, RU_лейбл, disp)` + `{ id = EN_id }` —
   фокус окна едет по id, подпись свободна (схема #12404).
3. Таблицу пополнить 3 архивными строками, ключ — id, не description.

## Зависимости

- Форма: `{ id = "WhatsApp" }` vs `focus = "WhatsApp"` (открытый вопрос #12557).
- 4-е поле через `parse_binding_records` (сортировка + слияние дублей) — отдельная ветка linyiru.
