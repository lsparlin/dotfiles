#!/bin/zsh
# this is auto-run because it is in the ZSH_CUSTOM directory

# history-substring-search = ZSH_CUSTOM/plugins/zsh-history-substring-search (from git)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
