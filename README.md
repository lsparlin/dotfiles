# dotfiles for my personal CLI setup
Setup Local cli environment with zsh, ohmyzsh, vim plugins, etc.

## Installation
Pull submodule deppendencies and plugins
```shel
git submodule update --recursive --init
```

Symlink all the dotfiles into the `$HOME` directory
```shell
# currently requries dotfiles to be inside $HOME ($HOME/dotfiles)

./link_dotfiles.sh
```
