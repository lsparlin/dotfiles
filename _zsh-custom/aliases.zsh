#!/bin/zsh
# this is auto-run because it is in the ZSH_CUSTOM directory

# zsh type aliases
alias -s md=vim

alias gst='git status -s'
alias mmv='noglob zmv -W'

alias vit='vi ~/.tmux.conf'
alias srcp='exec zsh'
alias srct='tmux source-file ~/.tmux.conf'

alias cdroot='cd "$(git rev-parse --show-toplevel)"'
alias flushcache="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder;"
alias redis="redis-server"
alias lswc="ls | wc"
alias vi='vim'
alias vimp='vim -p'
alias vimf='vim $(fzf --multi)'
alias spotlight_reset="sudo mdutil -E -a -i on"
alias tmux_panetitle='tmux set pane-border-status bottom; tmux set pane-border-format "#{pane_current_command}"'
alias lsl="exa --header --long --group --color=always --sort=type"
alias grep="grep --color=auto"
alias mux="tmuxinator"
alias lse="exa"
alias weather="curl -s wttr.in\?1TFn"

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# mysql
alias mysql-localhost='mysql -u root -p'
