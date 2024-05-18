if status is-interactive
    # Commands to run in interactive sessions can go here
end

fzf_configure_bindings --directory=\cf

# This does not seem to work in all environments
# source /usr/local/opt/asdf/libexec/asdf.fish

# ASDF gets deprioritized by some environments like tmux
# Also this seems to replace the commented out asdf setup script above
fish_add_path -m $HOME/.asdf/shims
