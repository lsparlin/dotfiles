#!/bin/zsh
# this is auto-run because it is in the ZSH_CUSTOM directory

export EDITOR='vim'

# Updates are done through omz command or dotfiles git submodule updates
DISABLE_AUTO_UPDATE="true"

# Do not automatically set the term title
DISABLE_AUTO_TITLE="true"

# ... when auto-completing
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

KEYTIMEOUT=1

# zsh-autosuggestions plugin
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#333"

# Homebrew completion setup
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Java
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
if [ -f "${HOME}/.asdf/plugins/java/set-java-home.zsh" ]; then
  . ~/.asdf/plugins/java/set-java-home.zsh
fi

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/lewis/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. $(brew --prefix asdf)/libexec/asdf.sh
