# Scripts

One-time setup helpers and utilities for the dotfiles repository.

These scripts are not symlinked into `~/.config/` — they are run manually when needed.

---

## Bootstrap Scripts

### `install_homebrew`
Installs Homebrew if not present, then runs `brew bundle install` to install tools from the root `Brewfile`.

**Usage:** Run first on a fresh machine (see root README for full sequence).

### `install_fisher`
Installs [Fisher](https://github.com/jorgebucaran/fisher), the Fish plugin manager, and installs plugins listed in `fish_plugins`.

**Usage:** Run after linking dotfiles.

### `link_dotfiles`
Creates symlinks from this repo to your home directory.

**Usage:**
```bash
./link_dotfiles         # Dry run — shows what would be linked
./link_dotfiles live    # Create actual symlinks
```

**Links created:**
- `HOME/*` → `~/.*`
- `HOME_config/*` → `~/.config/*`

### `test_link_dotfiles`
Tests the link script in a temporary directory without affecting your actual home directory.

**Usage:** `./test_link_dotfiles`

---

## Optional Helpers

### `init_screenshot_dir`
Creates `~/Screenshots` and configures macOS to save screenshots there instead of Desktop.

**Usage:** `./init_screenshot_dir`

### `install_italic_terms`
Compiles and installs terminfo files for italic support in tmux.

**Note:** Requires `tic` (built into macOS).

### `link_icloud_drive_obsidian`
Creates a convenient symlink at `~/icloud-obsidian` pointing to your Obsidian vault in iCloud Drive.

**Usage:** `./link_icloud_drive_obsidian`

---

## Terminfo Files

These files enable italic text in terminal emulators:

- `tmux-256color-italic.terminfo` — For use inside tmux
- `xterm-256color-italic.terminfo` — For terminal emulators

Install via: `./install_italic_terms`
