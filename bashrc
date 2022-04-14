# Fig pre block. Keep at the top of this file.
export PATH="${PATH}:${HOME}/.local/bin"
eval "$(fig init bash pre)"




# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
alias ls='ls -G'

ulimit -n 200000
ulimit -u 2048

[ -f ~/.fzf.bash ] && source ~/.fzf.bash



# Fig post block. Keep at the bottom of this file.
eval "$(fig init bash post)"
