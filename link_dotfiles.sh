#!/usr/bin/env bash

ls -l1 ~/dotfiles | grep -Ev "backup|link_dotfiles|plugins" | xargs -I% ln -vhs ~/dotfiles/% ~/.%
ln -hs ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf 

