#!/usr/bin/env bash

ls -l1 $HOME/dotfiles | grep -Ev "backup|link_dotfiles|custom" | xargs -I% ln -vhs $HOME/dotfiles/% $HOME/.%
ln -vhs $HOME/dotfiles/tmux/.tmux.conf $HOME/.tmux.conf 
ln -vs $HOME/dotfiles/zsh-custom/themes/spaceship-prompt/spaceship.zsh-theme zsh-custom/themes/
