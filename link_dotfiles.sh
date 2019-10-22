#!/usr/bin/env bash

ls -l1 $HOME/dotfiles | grep -Ev "backup|link_dotfiles|plugins" | xargs -I% ln -vhs $HOME/dotfiles/% $HOME/.%
ln -vhs $HOME/dotfiles/tmux/.tmux.conf $HOME/.tmux.conf 
ln -vhs $HOME/dotfiles/omz-plugins/zsh-autosuggestions $HOME/dotfiles/oh-my-zsh/custom/plugins/zsh-autosuggestions
ln -vhs $HOME/dotfiles/omz-plugins/zsh-history-substring-search $HOME/dotfiles/oh-my-zsh/custom/plugins/zsh-history-substring-search
ln -vhs $HOME/dotfiles/omz-plugins/zsh-syntax-highlighting $HOME/dotfiles/oh-my-zsh/custom/plugins/zsh-syntax-highlighting
ln -vhs $HOME/dotfiles/omz-plugins/spaceship-prompt/spaceship.zsh $HOME/dotfiles/oh-my-zsh/custom/themes/spaceship.zsh-theme
