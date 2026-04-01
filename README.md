# dotfiles

Personal CLI environment setup for macOS — Fish shell, Helix editor, Ghostty terminal.

## Initial Setup

Complete bootstrap sequence for a fresh macOS machine:

```bash
# 1. Install Command Line Tools (if needed)
xcode-select --install

# 2. Clone this repository
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles

# 3. Install Homebrew and core dependencies
./scripts/install_homebrew    # Also installs tools from Brewfile

# 4. Make Fish your default shell
chsh -s $(which fish)

# 5. Link dotfiles
./scripts/link_dotfiles live

# 6. Install Fish plugins
./scripts/install_fisher

# 7. Pull tmux plugin manager submodules
git submodule update --recursive --init

# 8. Install ASDF language versions
asdf install
```

After opening a new tmux session, press `prefix + I` (capital i) to install tmux plugins.

---

### Quick commands for existing machines

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
