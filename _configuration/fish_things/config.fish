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
# fish_add_path -m $HOME/.asdf/shims
# ASDF configuration code
if test -z $asdf_data_dir
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$asdf_data_dir/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims
