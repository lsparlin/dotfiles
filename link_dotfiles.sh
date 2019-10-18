#!/usr/bin/env bash

ls -l1 ~/dotfiles | grep -Ev "backup|link_dotfiles|plugins" | xargs -I% ln -vhs ~/dotfiles/% ~/.%
ln -vhs ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf 
ln -vhs ~/dotfiles/omz-plugins/zsh-autosuggestions ~/dotfiles/oh-my-zsh/custom/plugins/zsh-autosuggestions
ln -vhs ~/dotfiles/omz-plugins/zsh-history-substring-search ~/dotfiles/oh-my-zsh/custom/plugins/zsh-history-substring-search
mkdir ~/dotfiles/oh-my-zsh/custom/themes
ln -vhs ~/dotfiles/omz-plugins/spaceship-prompt/spaceship-prompt.zsh ~/dotfiles/oh-my-zsh/custom/themes/spaceship.zsh-theme
