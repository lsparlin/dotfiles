# dotfiles for my personal CLI setup
Setup Local cli environment with zsh, ohmyzsh, vim plugins, etc.

## Dependencies (git submodules)
Pull submodule deppendencies and plugins
```bash
cd [PATH_TO_DOTFILES]
git submodule update --recursive --init
```

## Homebrew

### Install
```bash
[PATH_TO_DOTFILES]/_configuration/install_homebrew.sh
```
OR install here [Homebrew](https://brew.sh)

### Brewfile
use homebrew's bundling feature to bring over my commonly used packages,
```bash
cd [PATH_TO_DOTFILES]
brew bundle
```

## Dotfiles
Automatically link:
- `.asdfrc`
- `.bashrc`
- `.gitconfig`
- `.gitignore`
- `.oh-my-zsh`
- `.tmux`
- `.tmux.conf.local`
- `.tmuxinator`
- `.tool-versions`
- `.vim`
- `.vimrc`
- `.zshrc`

### Dry run
Running the script with no args will dry-run and print out symlinks that would be created.
```bash
[PATH_TO_DOTFILES]/_link_dotfiles.zsh
```

### Symlink dotfiles into `$HOME` directory
Run with argument `live` to create symlinks
```bash
[PATH_TO_DOTFILES]./_link_dotfiles.zsh live
```

## Other helpers

### Tell MacOS to save screenshots in ~/Downlods
```bash
[PATH_TO_DOTFILES]/_configuration/init_screenshot_dir.sh
```

### Italics for terminal
```bash
[PATH_TO_DOTFILES]/_configuration/install_italic_terms.sh

# Remove this line from .tmux.conf.local if not installing italics
# set -g default-terminal 'tmux-256color-italic'
```

### Obsidian convenience symlink
If using Obsidian with iCloud storage, this will symlink that path (which is long) to `~/icloud-obsidian` for easier access from CLI
```bash
[PATH_TO_DOTFILES]/_configuration/link_icloud_obsidian.sh
```

