# Site review decisions (omacom/omarchy-site#251, reviewer vdmkotai)

Date: 2026-09-14. Proofreading: professional (ex-proofreader at a large publication).
Status: accepted nearly all suggestions; deliberate deviations listed below.

## Global rules
1. Headlines always capitalized.
2. Feed (news.json) — abbreviations (млн/млрд). Open-article headlines — full words (миллион/миллиард).
3. Numbers under one million — digits.
4. patron → меценат; Distinguished → почётный (меценат / корпоративный меценат).
5. Organization → фонд Omacom (masculine agreement).

## Deliberate deviations (with rationale for reviewer)
1. Menu CTA: "Стать меценатом-основателем" (short; tiers unfold in anchored section).
2. "More on" (X link) → "Мы на X.COM" (standard Russian social-link pattern).
3. Typewriter "missing app" → "создать недостающее приложение" (vibe-coding creates).
4. Dual boot → "Двойная загрузка" (standard term; choice-at-startup preserved).
5. Editor → "...сделайте его редактором по умолчанию." (brevity; page context is system-wide).
6. Typewriter prefix → "Эта группа выберет направления развития нашего дистрибутива" (no bureaucratic "ответственность").
7. "...шанс..., чего не было десятилетиями" (native-speaker fix).
8. Endowment — "противостояние" of retaining vs spending.
9. #97: "чего не было десятилетиями" (native-speaker fix).
10. #137: 13 млн USD, "неперечисленных" (quotes kept) — funds promised but not transferred.
11. #156: "Внимательно исследуйте..." (no moralizing "добросовестно").
12. #70: "Эти 12 меценатов-основателей" (digits rule).
13. #79: "Эта группа выберет направления..." (short; no criminal "ответственность").
9. Resolved back to reviewer: #42 (no GPU acceleration), #48/#330 ("карточку для соцсетей" — social card is shared outward).

## Plural tech-debt (separate tickets, don't block translation)
- PR counter: 1 пул-реквест / 2 пул-реквеста / 5 пул-реквестов (11–14 exception).
- Contributors: 1 участник / 2 участника / 5 участников.
- Screen-reader likes: 1 отметка «Нравится» / 2 отметки / 5 отметок.
- Screen-reader stars: 1 звезда / 2 звезды / 5 звёзд.
- All via Intl.PluralRules('ru') in shared components.

## Reviewer note posted
https://github.com/omacom/omarchy-site/pull/251#issuecomment-5662663988
