# wifi-dns — handoff (обновлено 30.09.2026)

Два плагина рядом, оба в `~/git/locale-ru/plugins/` (синхрон с origin):

## wifi-dns-ru 1.1.1 (русский)
Форк стокового `omarchy.network`: пилюли DHCP / NextDNS (45.90.28.0, DoT) /
DNS4EU (86.54.11.100) / OpenDNS / Custom. Русские подписи, refresh виджета
после смены DNS, install/remove/restore скрипты, SECURITY.md (prompt-only).

История: dns0.eu мёртв год → DNS4EU; Quad9 заглушен → NextDNS; переименования
resty.network → resty.wifi-dns-ru → wifi-dns-ru. Парольный грант удалён как
дыра 22.09 — только auth-диалог polkit-агента (fail-closed).

## wifi-dns 1.0.0 (английский, мировой)
Те же пилюли и механика, UI полностью английский, живое EN-превью.
Ноль кириллицы, структура побайтово = RU-версии.

## Смена DNS (оба)
Панель → `omarchy-dns <Provider>` → root нужен → ТОЛЬКО auth-диалог.
Скрипт: закреплённая копия `~/backups/network-dns/omarchy-dns` → live через
`reapply.sh` (sudo в терминале). Проверка: `omarchy dns <Name>`.

## Хуки и бэкапы (НЕ удалять)
- `~/.config/omarchy/hooks/post-update.d/network-dns-providers.hook`
- `~/backups/network-dns/`: omarchy-dns, reapply.sh, heal hook/sh, README.

## Магазин
- Отдельный репо `WokoFlipper/omarchy-network-ru` (клон: `~/git/omarchy-network-ru`).
- #8078 listing — опубликован. #8233/#8337/#8542 — закрыты (старые verify).
- #8616 (verify 1.1.1) — ЗАКРЫТА = verified + published (maintainer-reviewed).
- Тексты: «заглушены», без РКН-триггеров. sudo только с запросом.

## Upstream
- #12878 (RU DNS-пресеты) — без ответов. #12395 — фон.
- #13035 (speedtest Fast.com недоступен в РФ) — открыт 23.09.
- #13746 (бандл wifi-dns-ru в RU-установку) — открыт 29.09, без ответов.

## Открытое
- Конкурс плагинов $10k — не анонсирован; как выйдет, подать wifi-dns-ru.
- QUIC/DoQ — исследование (resolved не говорит QUIC, нужен локальный прокси).
- Краевно-зависимые пресеты в рантайме sbelcl — вопрос открыт.
