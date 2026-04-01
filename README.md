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
./scripts/link_dotfiles
```

Create symlinks:
```bash
./scripts/link_dotfiles live
```

Links are created for:
- `HOME/` → `~/.<filename>` (e.g., `HOME/gitconfig` → `~/.gitconfig`)
- `HOME_config/<app>/` → `~/.config/<app>/` (fish, helix, ghostty, bat)

## Tools

| Tool | Config location |
|------|----------------|
| Fish shell | `HOME_config/fish/` |
| Helix editor | `HOME_config/helix/` |
| Ghostty terminal | `HOME_config/ghostty/` |
| tmux | `HOME/tmux.conf` |
| git | `HOME/gitconfig` |
| ASDF versions | `HOME/tool-versions` |

## Other helpers

### Install Fisher (Fish plugin manager)
Run once on a new machine after linking dotfiles — installs plugins from `fish_plugins`:
```bash
./scripts/install_fisher
```

### Obsidian convenience symlink
If using Obsidian with iCloud storage, symlinks the long iCloud path to `~/icloud-obsidian`:
```bash
./scripts/link_icloud_drive_obsidian
```
