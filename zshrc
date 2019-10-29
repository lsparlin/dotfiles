# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
if [ -f $HOME/.env_variables ]; then 
  source $HOME/.env_variables # dev env variables
fi
NODE_PATH='/usr/local/lib/node_modules'
GREP_COLOR='1;32'

# Extra ZSH Built-Ins
autoload -U zmv

# symlink python2 because zsh uses it from /usr/local/opt...
if [ ! -f /usr/local/opt/python/bin/python2.7 ]; then
ln -s /usr/local/bin/python2.7 /usr/local/opt/python/bin/python2.7
fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="nanotech"
# ZSH_THEME="avit"
# ZSH_THEME="frisk"
# ZSH_THEME="af-magic"
ZSH_THEME="spaceship"

# Spaceship-theme prompt on
SPACESHIP_PROMPT_ORDER=(user dir host git_branch exec_time line_sep battery vi_mode jobs char) 
SPACESHIP_GIT_BRANCH_PREFIX=" "
SPACESHIP_GIT_BRANCH_SUFFIX=" " 
SPACESHIP_VI_MODE_INSERT="[vi-i]"
SPACESHIP_VI_MODE_NORMAL="[vi-c]"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"
KEYTIMEOUT=1

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
ZSH_CUSTOM=$HOME/dotfiles/zsh-custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew osx common-aliases tmux npm vi-mode history-substring-search zsh-autosuggestions zsh-syntax-highlighting docker)

# history-substring-search = ZSH_CUSTOM/plugins/zsh-history-substring-search (from git)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# User configuration

export PATH="$HOME/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export PATH="/Users/lsparlin/.rvm/gems/ruby-2.1.5/bin:/Users/lsparlin/.rvm/gems/ruby-2.1.5@global/bin:/Users/lsparlin/.rvm/rubies/ruby-2.1.5/bin:/usr/local/opt/elasticsearch/bin:/usr/local/mysql/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/opt/elasticsearch/bin:/usr/local/mysql/bin:/Users/lsparlin/.rvm/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

eval "$(rbenv init -)"
source $ZSH/oh-my-zsh.sh

ulimit -n 8192

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
# 

# Java
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

## --- Functions --- ##

function watchp() {
# watch the last command (excludes itself)
  WATCH_INT=10
	if [ "$#" -eq 1 ]; then
		WATCH_INT=$1
	fi

  r -lnr | \
		grep -v '^watchp' | \
		head -1 | \
		xargs -I% watch -n $WATCH_INT %
}

function sys_notify() {
  MESSAGE="[No Message]"
  if [ "$#" -gt 0 ]; then
    MESSAGE=$1
  fi
  osascript -e "display notification \"$MESSAGE\" with title \"CLI Message\" sound name \"Pop\""
}

alias prevcmd="r -lnr | grep -v '^prevcmd' | head -1"

function prevcmd_to_alias() {
  if [ "$#" -lt 1 ]; then
		echo "Enter alias name as parameter"
		return 1
	fi

	prevcmd | xargs -I{} echo "alias $1=\"{}\""
}

function copyEmojiLewis() {
  FILE_PREFIX="lewis"
  if [ "$#" -gt 1 ]; then
    FILE_PREFIX=$2
  fi
  if [ "$#" -lt 1 ]; then
    pbcopy < "$HOME/parrot/${FILE_PREFIX}_parrot.txt"
    return 1
  fi

  sed "s/parrot/$1/g" "$HOME/parrot/${FILE_PREFIX}_parrot.txt" | pbcopy
}

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias git=hub # per hub documentation
alias gst='git status -s'
alias mmv='noglob zmv -W'
alias vit='vi ~/.tmux.conf'
alias srcp='source ~/.zshrc && echo "\n\e[1m\e[32mSUCCESS: loaded profile ~/.zshrc";'
alias srct='tmux source-file ~/.tmux.conf'
alias gitrepo='cd ~/Development/git'
alias cdroot='cd "$(git rev-parse --show-toplevel)"'
alias rmi='rm -i'
alias flushcache="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder;"
alias redis="redis-server"
alias lswc="ls | wc"
alias vi='vim'
alias vip='vim -p'
alias vim-tabs='vim "+set noexpandtab"'
alias spotlight_reset="sudo mdutil -E -a -i on"
alias tmux_panetitle='tmux set pane-border-status bottom; tmux set pane-border-format "#{pane_current_command}"'
alias lsl="exa --header --long --group --color=always"
alias grep="grep --color=auto"

alias npm-low="sudo npm install -g npm@4.6.1"  # from Neal
alias npm-high="sudo npm install -g npm@6.9.0" # from Neal

# flyway
alias flyway-receipts='flyway -url="jdbc:mysql://127.0.0.1:3306/receipts?autoReconnect=true&useUnicode=yes&characterEncoding=UTF-8&serverTimezone=UTC" -locations="filesystem:/$HOME/Development/git/analyst-ng/source/ext-db/receipts/"'
alias flyway-analyst='flyway -url="jdbc:mysql://127.0.0.1:3306/analyst?autoReconnect=true&useUnicode=yes&characterEncoding=UTF-8&serverTimezone=UTC" -locations="filesystem:/$HOME/Development/git/analyst-ng/source/ext-db/analyst-ng/" -schemas=analyst,evun'
alias flyway-boxbe='flyway -url="jdbc:mysql://127.0.0.1:3306/boxbe?autoReconnect=true&useUnicode=yes&characterEncoding=UTF-8&serverTimezone=UTC" -locations="filesystem:/$HOME/Development/git/analyst-ng/boxbe/database/main/"'
alias flyway-dev='flyway -url="jdbc:mysql://127.0.0.1:3306/analystFlywayDev?autoReconnect=true&useUnicode=yes&characterEncoding=UTF-8&serverTimezone=UTC" -locations="filesystem:/$HOME/Development/git/analyst-ng/source/ext-db/analyst-ng-dev-load/" -schemas='
alias flyway-boxbe-dev='flyway -url="jdbc:mysql://127.0.0.1:3306/boxbeFlywayDev?autoReconnect=true&useUnicode=yes&characterEncoding=UTF-8&serverTimezone=UTC" -locations="filesystem:/$HOME/Development/git/analyst-ng/boxbe/database/dev-load/"'
alias flyway-reset='flyway-analyst clean migrate; flyway-dev clean migrate'

# mysql
alias mysql-eds='mysql -u edsro -pedsRO123 -h aurora01-cluster.cluster-c5anvjpieaue.us-east-1.rds.amazonaws.com'
alias mysql-localhost='mysql -u root -p'

##
### ---- Unsorted Aliases
##
alias gh_opendir='git remote get-url upstream | sed -E "s;git@github.com:(.*)/(.*)\.git;https://github.com/\1/\2/tree/develop-analyst/;g" | xargs -I% open "%$(git rev-parse --show-prefix)"'
function gh_open() {
  if [ "$#" -lt 1 ]; then
		echo "Enter filename as parameter!"
		return 1
	fi

	git remote get-url upstream | \
    sed -E 's;git@github.com:(.*)/(.*)\.git;https://github.com/\1/\2/blob/develop-analyst/;g' | \
    xargs -I% open "%$(git rev-parse --show-prefix)$1"
}
alias gh_prinfo='hub pr list | grep -i $(git rev-parse --abbrev-ref HEAD | sed -E "s/([A-Z]{2})-([[:digit:]]{4})-.*/\1[-[:blank:]]*\2/g")'
alias christmas_tree="docker pull lsparlin88/christbashtree:latest; docker run -it -e COLUMNS=$COLUMNS lsparlin88/christbashtree:latest"
