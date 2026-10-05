# Инструкция по русским скриншотам (manual-ru, 23 шт.)

## Подготовка (разово)
1. Применить локаль: `python3 bindings-translate apply ru_RU`, панели sbelcl стоят, `~/.config/omarchy/locales/ru.json` свежий (242 ключа).
2. Система на русском: раскладка, меню и панели показывают RU-строки. Проверить: `SUPER+K` — описания по-русски.
3. Чистый стол: обои нейтральные, лишние окна закрыты, бар сверху, масштаб 1x (чтобы размеры совпали со стоком).

## Чем снимать
- Регион: `grim -g "$(slurp)" /tmp/shot.png` (slurp — выделить мышью).
- Окно/монитор: `omarchy capture screenshot region|windows|fullscreen`.
- Формат: PNG → WebP: `cwebp -q 85 /tmp/shot.png -o <имя>.webp` (или `ffmpeg -i /tmp/shot.png -quality 85 <имя>.webp`).
- Имена и размеры — как в стоке (см. таблицу ниже). Класть в `translations/manual-ru/images/`.

## Карта (что снимать, 44 шт.)
| Файл | Как снять |
|---|---|
| install-config.webp, install-done.webp | ISO в VM (не переснять живьём!): QEMU + RU-установщик, скрины мастера установки |
| install-done — см. выше | |
| navigation-*.webp (6 шт) | Открыть терминал+браузер (`SUPER+Return`, `SUPER+SHIFT+Return`), `SUPER+J` стаканит; fourway: +`SUPER+CTRL+T` +`SUPER+SHIFT+F`; dwindle/scrolling: `SUPER+L` тогл; popped: `SUPER+O` |
| clipboard-history*.webp (2) | `SUPER+CTRL+V` с парой записей в истории |
| text-extraction.webp | `SUPER+CTRL+PrtScr`, выделить текст |
| tmux-tdl*.webp (4) | `tdl c`, `tdl c cx`, `tdlm`, `tsl 4 c` в терминале |
| reminders.webp | `SUPER+CTRL+R` диалог |
| notice-datetime/weather/battery.webp (3) | `SUPER+CTRL+ALT+T/W/B` |
| gaming-*.webp (6) | Steam/RetroArch/Minecraft/Xbox/GeForce/Starcraft — окна приложений (RU UI где есть) |
| fonts-jetbrainsmono.webp | Терминал с текстом |
| prompt.webp | Терминал со starship-промптом |
| branding-*.webp (3) | plymouth preview, скринсейвер ASCII, about-окно |
| snapshots-bootloader/restore.webp (2) | Limine-меню + нотификация рестор (VM!) |
| dual-boot-*.webp (7) | Windows diskmgmt + Limine — только VM/пересказ, живьём не снимать |
| update-available.webp | Бейдж обновления у часов (симулировать? пропустить если нет апдейта) |
| macbook-omarchy.webp | чужое фото — НЕ переснимать, оставить сток |
| troubleshooting-1password.webp | диалог 1Password (пропустить если нет аккаунта) |
| windows-vm.webp | окно Windows VM |
| install-config/done — см. выше | |

## Правила
- UI на скриншоте — русский (панели, меню, диалоги). Английскими остаются только непереводимые имена (бренды, команды).
- Без личных данных: терминалы с `~/Work`, вкладки браузера, IP, имена машин — замазать/обрезать.
- Размер ≈ стоку (±20%). Проверить: `ls -la` рядом со стоковым файлом.
- После замены: `grep` имя файла в md — путь `images/<имя>.webp` совпадает.

## Проверка
```
ls translations/manual-ru/images/ | wc -l   # = 23
```
