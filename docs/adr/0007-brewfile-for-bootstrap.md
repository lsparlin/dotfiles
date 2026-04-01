# 7. Brewfile for Bootstrap Dependencies

Date: 2026-04-01  
Status: Accepted  
Amends: 2026-04-cleanup.md (Phase 1)

## Context

The 2026-04-cleanup.md plan listed "Delete [Brewfile] entirely" under Phase 1 — Remove Unused Tool Configs. At the time, the rationale was that Homebrew dependencies could be installed manually or were documented elsewhere.

However, the Brewfile serves a critical role in fresh machine setup: it defines the minimal set of tools required before dotfiles can be fully functional. Without automated installation, a user would need to manually run:

```bash
brew install fish helix ghostty bat fzf tmux diff-so-fancy asdf
```

These tools are fundamental to the dotfiles configuration:
- **fish**: The configured shell (config files are useless without it)
- **helix**: The configured `$EDITOR` (git will fail without it)
- **ghostty**: The configured terminal emulator
- **bat, fzf, tmux**: Referenced in shell configs and aliases
- **diff-so-fancy**: Referenced in `gitconfig` as the pager
- **asdf**: The version manager configured in `config.fish`

## Decision

Keep the `Brewfile` at the repository root. It provides a single command (`brew bundle install --file=Brewfile`) to install all bootstrap dependencies on a fresh macOS machine.

This reverses the "delete entirely" decision from 2026-04-cleanup.md.

## Consequences

- **Positive:** One-command bootstrap for fresh machines
- **Positive:** Documents the minimal installed tool surface area
- **Negative:** Additional file to maintain when tools change (mitigated by infrequent changes to core stack)
- **Dependency:** Requires Homebrew to be installed first (documented in README setup sequence)

## Future Considerations

If the tool stack expands significantly, consider splitting into:
- `Brewfile`: Core bootstrap (always needed)
- `Brewfile.optional`: Nice-to-haves installed separately

Currently, all seven tools are essential, so a single file is appropriate.
