#!/bin/zsh
# this is auto-run because it is in the ZSH_CUSTOM directory

# Themes in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="spaceship"

SPACESHIP_ROOT=$ZSH_CUSTOM/themes/spaceship-prompt

# SPACESHIP customizations

# prompt
SPACESHIP_CHAR_SYMBOL="☕️>_"
SPACESHIP_PROMPT_ORDER=(user dir host git_branch ruby exec_time line_sep battery vi_mode jobs char) 
# SPACESHIP_GIT_BRANCH_PREFIX=" "
SPACESHIP_GIT_BRANCH_PREFIX="🌿"
SPACESHIP_GIT_BRANCH_SUFFIX=" " 
SPACESHIP_VI_MODE_INSERT="[i]"
SPACESHIP_VI_MODE_NORMAL="[c]"
SPACESHIP_EXEC_TIME_PREFIX="⏱ "
SPACESHIP_RUBY_SYMBOL="💎"

# eval spaceship_vi_mode_enable
