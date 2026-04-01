# 6. Repo Structure: HOME/ and HOME_config/ Directories

Date: 2026-04-01
Status: Accepted
Supersedes: 0004

## Context

Root-level dotfiles (gitconfig, tmux.conf, etc.) lived alongside repo infrastructure (README.md, CLAUDE.md, docs/, scripts/, tpm/) with no structural distinction between them. The `_link_dotfiles` script had to maintain an explicit exclusion list to avoid treating repo files as dotfiles:

```bash
grep -vE '^(README\.md|CLAUDE\.md|docs|scripts|tpm|_configuration|_link_dotfiles|\..*)'
```

This exclusion list was implicit knowledge — adding a new repo-level file required remembering to update it, and the invariant wasn't obvious from the directory layout alone.

Similarly, `_configuration/` was a prefixed name that implied "not a real dotfile location" but didn't communicate what it mapped to.

## Decision

Introduce two directories that make the filesystem mapping explicit:

- **`HOME/`** — files symlinked to `~/.<filename>`. The link script reads this directory with no exclusions.
- **`HOME_config/`** — directories symlinked to `~/.config/<name>`. Replaces `_configuration/`.

Repo infrastructure (CLAUDE.md, README.md, docs/, scripts/, tpm/) stays at the root. The distinction between "things that get linked" and "things that don't" is now structural, not encoded in a filter.

The `link_dotfiles` script's `list_linkable_dotfiles` function simplifies to:

```bash
list_linkable_dotfiles() {
  ls -1 "$DOTFILES_DIR/HOME"
}
```

## Consequences

- The purpose of the repo is visible at a glance from the directory listing
- No exclusion list to maintain; adding a new dotfile means adding it to `HOME/`
- Adding a new app config means adding it to `HOME_config/` — consistent with the invariant established in ADR 0004
- Existing symlinks on live machines need to be re-run with `scripts/link_dotfiles live` after this change; the `-f` flag handles replacement
