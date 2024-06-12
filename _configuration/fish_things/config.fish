if status is-interactive
    # Commands to run in interactive sessions can go here
end

# if fzf is installed 
# setup fzf keybindings (per homebrew instructions)
which fzf >/dev/null && fzf --fish | source || echo "INFO: fzf not installed"

# This does not seem to work in all environments
# source /usr/local/opt/asdf/libexec/asdf.fish

# ASDF gets deprioritized by some environments like tmux
# Also this seems to replace the commented out asdf setup script above
fish_add_path -m $HOME/.asdf/shims
