#!/usr/bin/env bash

ls -l1 | grep -Ev "backup|link_dotfiles" | xargs -I% ln -hs `pwd`/% ~/.%

