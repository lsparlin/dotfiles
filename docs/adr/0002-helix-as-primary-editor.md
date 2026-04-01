# 2. Helix as Primary Editor

Date: 2026-04-01  
Status: Accepted

## Context

The dotfiles repo contained three separate editor configurations: a legacy `vimrc` + `vim/` directory (Vim-Plug, ~89MB of plugins), a full Lua-based Neovim config in `_configuration/nvim/` (lazy.nvim, LSP, Treesitter, etc.), and a minimal Helix config in `_configuration/helix/`. All three were symlinked and maintained in parallel. The `gitconfig` already pointed to `hx` (Helix) as the default editor, signaling which tool was actually in use.

## Decision

Helix is the primary (and only) editor configured in this repo. Vim and Neovim configurations are removed.

Helix was chosen because:
- It was already set as the default `$EDITOR` in `gitconfig`
- It requires zero plugin management — LSP, Treesitter, and fuzzy finding are built in
- The existing Helix config is minimal and complete (theme + one custom keybind)
- Removing Vim's `plugged/` directory recovers ~89MB from the repo

## Consequences

- `vimrc`, `vim/`, and `_configuration/nvim/` are deleted
- The repo no longer configures a fallback editor for environments where Helix isn't available (use system `vi` in those cases)
- Neovim-specific tooling (coc.nvim, lazy.nvim lockfile) is no longer tracked here
