# Миграция Thunderbird → Betterbird 23.09 (локально)

## Порядок
1. Бэкап профиля: `~/.config/thunderbird/` → `~/backups/thunderbird-profile-2026-09-23.tar.gz`.
2. Узнать, чем стоят пакеты (pacman/AUR-хелпер: yay/paru?).
3. Снести thunderbird (sudo в терминале — моя сессия без TTY).
4. Поставить betterbird (AUR).
5. Профиль: Betterbird подхватывает тот же формат (скопировать/указать профиль).
6. Проверка: запуск + синк Gmail + OAuth.

## Статус
- [x] бэкап профиля (1.4M, `~/backups/thunderbird-profile-2026-09-23.tar.gz`)
- [x] снос thunderbird (pacman -R, в терминале)
- [x] установка betterbird (yay → betterbird-ru-bin 153.3.0esr, вариант 9)
- [x] миграция профиля (тот же `~/.config/thunderbird`, подхватился сам)
- [x] синк проверен — всё работает; Alt+M переназначен на betterbird
