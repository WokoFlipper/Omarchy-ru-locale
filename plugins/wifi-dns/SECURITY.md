# SECURITY — wifi-dns

## Model: prompt-only

The plugin runs at runtime **without root**: QML + a call to the system utility
`omarchy-dns`. DNS switching goes **only through the polkit agent auth dialog** —
every click, no exceptions. There is no silent mode: the password sudo rule was
removed from the package as a hole (any local process could silently change DNS).
Why: switching DNS writes the NetworkManager system config — a root-level action,
and the only honest way to offer it from the panel without a terminal is an
explicit human confirmation.

## Honest risks (what remains and why it is acceptable)

- **No enterprise (EAP) Wi-Fi**: the inherited PEAP/MSCHAPv2 profile path
  skips CA validation (rogue-AP credential capture — flagged in marketplace
  review). Removed entirely; enterprise networks show a notice pointing to
  system settings. Consumer plugin by design.
- **No agent — no switching** (fail-closed): nobody to show the dialog,
  the button silently does nothing. This is a safe failure; agent liveness is
  checked by a hook (`polkit-agent`). The reverse — a quiet "done" — would be worse.
- **Button values are code** (`DHCP/NextDNS/DNS4EU/...`): a typo = unmatched
  provider = refusal. Old spellings are therefore kept as aliases in the script.
- **Flap after switching**: NM reloads the stack, the widget pulls fresh
  state (`refresh()`), "no connection" may flash for a second.
- **Updates overwrite system files** (script, panel): pinned copies +
  pacman hook + drift hook restore; `reapply.sh` fixes manually.
- Marketplace verification (if any) is not a security audit.

## Verification status

- ☐ Sudo rule scope (bypass via arguments/environment).
- ☐ Pinned script diff vs upstream.
- ☐ Marketplace Automated Security Baseline.
