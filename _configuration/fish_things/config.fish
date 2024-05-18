if status is-interactive
    # Commands to run in interactive sessions can go here
end

source /opt/homebrew/opt/asdf/libexec/asdf.fish
fzf_configure_bindings --directory=\cf

# This does not seem to work anymore
# source /usr/local/opt/asdf/libexec/asdf.fish

# ASDF gets deprioritized by some environments like tmux
fish_add_path -m $HOME/.asdf/shims
