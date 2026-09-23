# wifi-dns-ru — handoff для отдельного чата (локально, НЕ пушить без спроса)

## Что это
Форк стокового `omarchy.network`: пилюли DHCP / NextDNS / DNS4EU / OpenDNS / Custom
(сток: DHCP/Cloudflare/Google/Custom — CF и Google мертвы в РФ).
Русские подписи, refresh виджета после смены DNS, install/remove/restore скрипты.

## История (сентябрь 2026)
- Пилюли зашиты локально (`~/.config/omarchy/plugins/wifi-dns-ru/`, бывший resty.network).
- dns0.eu мёртв год → заменён DNS4EU Unfiltered (86.54.11.100/.200, DoT unfiltered.joindns4.eu, замер ~1мс).
- Quad9 → NextDNS (45.90.28.0/.30, DoT dns.nextdns.io, оба живы).
- Переименования: resty.network → resty.wifi-dns-ru → wifi-dns-ru (без префикса).
- Манифест: name «Wi-Fi + DNS RU», displayName «Wi-Fi + DNS».

## Как работает смена DNS
Панель → `omarchy-dns <Provider>` без терминала → нужен root:
- **Сейчас: ТОЛЬКО с запросом** (парольный грант удалён как дыра 22.09).
  Auth-диалог через polkit-агента (gnome-агент в autostart + шелл регистрирует свой).
- Скрипт: закреплённая копия `~/backups/network-dns/omarchy-dns` → live `/usr/bin/omarchy-dns`
  через `~/backups/network-dns/reapply.sh` (sudo в терминале).
- После смены: `root.refresh()` в QML (иначе залипает «нет подключения»); NM флэпит — норма.
- Проверка живости: `omarchy dns <Name>` + `resolvectl query example.com`.

## Хуки и бэкапы (НЕ удалять до внедрения+проверки)
- `~/.config/omarchy/hooks/post-update.d/network-dns-providers.hook` — дрейф пилюль (NextDNS/DNS4EU) + polkit-агент.
- `~/backups/network-dns/`: omarchy-dns, reapply.sh, heal hook/sh, README.
- Бэкапы `~/backups/*Panel.qml*`, `shell.json-*`, `*-pre-rename*`.

## Магазин
- Отдельный репо: `WokoFlipper/omarchy-network-ru` (manifest, Panel, Model, README RU/EN, LICENSE MIT, install/remove/restore, preview.png, SECURITY.md).
- Заявка #8078 (listing) — опубликовано + verified (maintainer-reviewed).
- Верификация апдейта #8233 (f07a173) и #8337 (ed17bde, с DNS4EU) — baseline review-required, ждём мейнтейнеров.
- В текстах: sudo ТОЛЬКО с запросом, тихого режима нет (иначе не примут).

## Upstream
- #12878 (RU DNS-пресеты) — без ответов. #12395 (гард + редактируемые пресеты) — фон.

## Версии (сейчас 1.1.0)
- 1.0.0: первый пакет (пилюли Quad9/DNS0.eu, скрипты, маркет).
- 1.1.0: DNS0.eu→DNS4EU, Quad9→NextDNS, переименования id, prompt-only, превью.

## Открытое (не двигать без «да»)
- Пуши: locale-ru и netpub ahead — ждут команды.
- QUIC-серверы (DoQ): исследование дальше, нужен локальный прокси (resolved не говорит QUIC).
- Вопрос sbelcl: краевно-зависимые пресеты в его рантайме.
- Страховка `backup-pre-purge` — до русского в Omarchy.
