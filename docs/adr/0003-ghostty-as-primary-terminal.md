# 3. Ghostty as Primary Terminal Emulator

Date: 2026-04-01  
Status: Accepted

## Context

The dotfiles repo contained configs for three terminal emulators: Kitty (`kitty.conf`, ~20KB), WezTerm (`wezterm.lua`), and Ghostty (`config`, 5 lines). All three used identical settings — Dracula theme, MonoLisa font, similar font sizes — making the duplication purely overhead. Maintaining three configs meant any appearance change needed to be applied in three places.

## Decision

Ghostty is the primary (and only) terminal emulator configured in this repo. Kitty and WezTerm configurations are removed.

Ghostty was chosen because:
- Its config is intentionally minimal — sane defaults mean less to maintain
- It is the terminal actively in use (confirmed by `fish_user_paths` including the Ghostty CLI path)
- The Kitty config was 20KB of mostly-commented options that added noise without value

## Consequences

- `_configuration/kitty/` and `_configuration/wezterm/` are deleted
- Font and theme preferences are now expressed in one place only (`_configuration/ghostty/config`)
- Any machine using Kitty or WezTerm will need its own config — this repo no longer provides one
