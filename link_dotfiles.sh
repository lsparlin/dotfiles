#!/usr/bin/env bash

ls -l1 ~/dotfiles | grep -Ev "backup|link_dotfiles|plugins" | xargs -I% ln -vhs ~/dotfiles/% ~/.%
ln -hs ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf 
ln -hs ~/dotfiles/omz-plugins/zsh-autosuggestions ~/dotfiles/oh-my-zsh/custom/plugins/zsh-autosuggestions
ln -hs ~/dotfiles/omz-plugins/zsh-history-substring-search ~/dotfiles/oh-my-zsh/custom/plugins/zsh-history-substring-search
mkdir ~/dotfiles/oh-my-zsh/custom/themes
ln -hs ~/dotfiles/omz-plugins/spaceship-prompt/spaceship-prompt.zsh-theme ~/dotfiles/oh-my-zsh/custom/themes/spaceship.zsh-theme
