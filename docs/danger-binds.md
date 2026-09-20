# 4 опасных бинда (window matcher, omacom/omarchy#12404)

Эти привязки ищут окно через jq-регекс по описанию (`command_from` в
`default/hypr/helpers.lua:56-72` → `omarchy-launch-or-focus:13`). Перевод
описания ломает фокус: вместо фокуса каждый раз плодится новое окно.

- WhatsApp (`default/hypr/bindings/applications.lua:28`)
- Google Messages (`:29`)
- Google Photos (`:30`)
- Google Maps (`:31`)

Все четыре — имена продуктов, переводчик их likely оставит, поэтому это
ловушка, а не баг. При схеме stable id чинить первыми. Наш archive
(bindings-ru.tsv) их не трогает.
