# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository for macOS development environment setup. It contains configuration files for Fish shell, Helix editor, Ghostty terminal emulator, tmux, and various CLI tools.

## Structure

- **Root level**: Dotfiles that get symlinked to `~/.<filename>` (e.g., `gitconfig`, `tmux.conf`)
- **`_configuration/`**: App-specific configs in `~/.config/` (fish, helix, ghostty, bat)
- **`_link_dotfiles`**: Script to create symlinks from this repo to `$HOME`
- **`tpm/`**: Git submodule for Tmux Plugin Manager
- **`docs/`**: ADRs and plans documenting tool decisions and one-off tasks

## Common Commands

### Initial Setup
```bash
# Pull git submodules (tpm)
git submodule update --recursive --init
```

### Linking Dotfiles
```bash
# Dry run - see what would be linked
./_link_dotfiles

# Actually create symlinks
./_link_dotfiles live
```

Links are created for:
- Root files (e.g., `gitconfig` → `~/.gitconfig`)
- Config directories in `~/.config/`

## Tool-Specific Notes

### Fish Shell
- Plugins managed via `fish_plugins` file (Fisher)
- Custom functions/aliases in `_configuration/fish/aliases/`
- ASDF version manager integration configured in `config.fish`
- Pure prompt preferences set via `set -U` in `config.fish`
- `fish_variables` is NOT tracked — it is Fish's local runtime state

### Helix
- Minimal config using Dracula theme
- Custom keybind: `X` extends line above (opposite of `x`)
- LSP config for TypeScript/ESLint in `languages.toml`

### tmux
- Plugin manager: tpm (in `tpm/` submodule)
- Install plugins: `prefix + I` (capital i) after starting tmux
- Theme: Dracula with battery and time plugins

### ASDF Version Manager
- Defined tool versions in `tool-versions`
- Currently: Ruby 3.3.7, Node.js, Java 17

## Git Configuration

- Default branch: `main`
- Editor: `hx` (Helix)
- Pager: `diff-so-fancy`
- Pull strategy: rebase with merges preserved
- Common aliases: `st`, `aa`, `cm`, `lg`, `ch`, `sw`, `rst`

## Documentation

Architecture Decision Records (ADRs) in `docs/adr/` document why specific tools were chosen. See `docs/plans/` for one-off task plans.
