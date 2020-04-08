#!/usr/bin/env bash

MY_DOTFILES_DIR=$HOME/dotfiles

ls -l1 $MY_DOTFILES_DIR |\
  grep -Ev "backup|link_dotfiles|custom" |\
  xargs -I% ln -fvhs $MY_DOTFILES_DIR/% $HOME/.%
ln -fvhs $MY_DOTFILES_DIR/tmux/.tmux.conf $HOME/.tmux.conf 
ln -fvhs $MY_DOTFILES_DIR/zsh-custom/themes/spaceship-prompt/spaceship.zsh $MY_DOTFILES_DIR/zsh-custom/themes/spaceship.zsh-theme
