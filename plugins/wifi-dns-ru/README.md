# wifi-dns-ru — Wi-Fi + DNS RU

## Зачем / Why

**RU:** Стоковый виджет предлагает Cloudflare (1.1.1.1) и Google (8.8.8.8) — оба заблокированы/заглушены в России. Этот форк меняет пилюли на рабочие: Quad9 (9.9.9.9), DNS4EU, OpenDNS + Custom. Плюс: виджет обновляет состояние после смены DNS (в стоке залипает «нет подключения»). Временное решение, пока мейнтейнеры не разрешат локальные пресеты (upstream issue: RU DNS presets).

**EN:** Stock pills (Cloudflare, Google) are blocked/throttled in Russia. This fork ships working presets — Quad9 (9.9.9.9), DNS4EU, OpenDNS + Custom — and refreshes widget state after a DNS switch (stock sticks on "no connection"). Temporary until maintainers allow locale DNS presets.

## Что изменено / Changes vs stock `omarchy.network`

1. `dnsProviders`: `[DHCP, Quad9, DNS4EU, OpenDNS, Custom]` (было: DHCP, Cloudflare, Google, Custom).
2. Тултипы пилюль + `root.refresh()` после смены DNS (`onExited`).
3. Остальное — сток.

## Установка / Install

```bash
./install.sh
```

Перезапустить шелл: `omarchy-restart-shell`. Смена DNS требует root один раз
(см. upstream: парольное sudo-правило `omarchy-dns` или polkit-агент).

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
