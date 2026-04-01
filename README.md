# dotfiles

Personal CLI environment setup for macOS — Fish shell, Helix editor, Ghostty terminal.

## Initial Setup

### Pull submodules
```bash
git submodule update --recursive --init
```

### Link dotfiles

Dry run (shows what would be linked):
```bash
./_link_dotfiles
```

Create symlinks:
```bash
./_link_dotfiles live
```

Links are created for:
- Root dotfiles (e.g., `gitconfig` → `~/.gitconfig`)
- Config directories in `~/.config/` (fish, helix, ghostty, bat)

## Tools

| Tool | Config location |
|------|----------------|
| Fish shell | `_configuration/fish_things/` |
| Helix editor | `_configuration/helix/` |
| Ghostty terminal | `_configuration/ghostty/` |
| tmux | `tmux.conf` |
| git | `gitconfig` |
| ASDF versions | `tool-versions` |

## Other helpers

### Obsidian convenience symlink
If using Obsidian with iCloud storage, symlinks the long iCloud path to `~/icloud-obsidian`:
```bash
./_configuration/link_icloud_obsidian
```
