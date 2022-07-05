export ZSH=$HOME/.oh-my-zsh

ZSH_CUSTOM=$HOME/dotfiles/_zsh-custom
# NOTE settings, mappings, aliases are defined in ZSH_CUSTOM

plugins=(git brew z macos common-aliases npm vi-mode tmux tmuxinator dirhistory history-substring-search zsh-autosuggestions zsh-syntax-highlighting)

# local env
[ -f $HOME/.env_variables.zsh ] && source $HOME/.env_variables.zsh 
[ -f $HOME/.env_settings.zsh ] && source $HOME/.env_settings.zsh 
[ -f $HOME/.local_scripts.zsh ] && source $HOME/.local_scripts.zsh 

# Extra ZSH Built-Ins
autoload -U zmv

export PATH="$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

source $ZSH/oh-my-zsh.sh

ulimit -n 8192

eval spaceship_vi_mode_enable
