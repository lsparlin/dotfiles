#!/usr/bin/env bash

MY_DOTFILES_DIR=$HOME/dotfiles

ls -l1 $MY_DOTFILES_DIR |\
  grep -Ev "README|link_dotfiles|custom|configuration" |\
  xargs -I% ln -fvhs $MY_DOTFILES_DIR/% $HOME/.%

# ~/.tmux.conf is the native location for tmux config
ln -fvhs $MY_DOTFILES_DIR/tmux/.tmux.conf $HOME/.tmux.conf 

# ohmyzsh looks for theme files in $ZSH_CUSTOM/themes
ln -fvhs $MY_DOTFILES_DIR/zsh-custom/themes/spaceship-prompt/spaceship.zsh $MY_DOTFILES_DIR/zsh-custom/themes/spaceship.zsh-theme
