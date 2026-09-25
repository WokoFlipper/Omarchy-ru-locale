# wifi-dns-ru — Wi-Fi + DNS RU

## Зачем / Why

**RU:** Стоковый виджет предлагает Cloudflare (1.1.1.1) и Google (8.8.8.8) — оба заглушены в России. Этот форк меняет пилюли на рабочие: NextDNS (45.90.28.0, DoT), DNS4EU (86.54.11.100), OpenDNS + Custom. DNS4EU заменил мёртвый dns0.eu (не отвечает больше года): для России это рабочий и быстрый вариант (~1 мс, замерено), плюс EU-юрисдикция. Плюс: виджет обновляет состояние после смены DNS (в стоке залипает «нет подключения»). Все варианты проверены методом испытаний в реальных условиях; на момент выбора они не блокировались. Временное решение, пока мейнтейнеры не разрешат локальные пресеты (upstream issue: RU DNS presets).

**EN:** Stock pills (Cloudflare, Google) are throttled in Russia. This fork ships working presets — NextDNS (45.90.28.0, DoT), DNS4EU (86.54.11.100), OpenDNS + Custom. DNS4EU replaces dead dns0.eu (unresponsive for over a year): for Russia it is a working, fast option (~1 ms measured) under EU jurisdiction — and refreshes widget state after a DNS switch (stock sticks on "no connection"). Temporary until maintainers allow locale DNS presets.

## Что изменено / Changes vs stock `omarchy.network`

1. `dnsProviders`: `[DHCP, NextDNS, DNS4EU, OpenDNS, Custom]` (было: DHCP, Cloudflare, Google, Custom).
2. Тултипы пилюль + `root.refresh()` после смены DNS (`onExited`).
3. Остальное — сток.

## Установка / Install

```bash
./install.sh
```

Перезапустить шелл: `omarchy-restart-shell`. Смена DNS идёт только через
auth-диалог polkit-агента (каждый клик).

**Про sudo: переключение ТОЛЬКО с запросом.** Каждый клик по пилюле
показывает auth-диалог через polkit-агента. Тихого (парольного) режима нет
сознательно: молчаливое переключение DNS любым локальным процессом —
дыра, закрыта 22.09. Детали — в `SECURITY.md`.

## Удаление / Remove

```bash
./remove.sh
```

Возвращает стоковый `omarchy.network` (личные файлы — в бэкап с меткой времени).

## Восстановление / Restore

`~/.config` обновлениями не затирается, но на всякий случай:

```bash
./restore.sh   # переустановить из этого репо
```

## Лицензия / License

MIT
