#!/usr/bin/env bash

ls -l1 ~/dotfiles | grep -Ev "backup|link_dotfiles" | xargs -I% ln -hs `pwd`/% ~/.%
ln -hs ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf 

