if status is-interactive
    # Commands to run in interactive sessions can go here
end

# if fzf is installed 
# setup fzf keybindings (per homebrew instructions)
which fzf >/dev/null && fzf --fish | source || echo "INFO: fzf not installed"

# ASDF configuration code as recommended by asdf docs
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

# Chime ONLY
source ~/.chime_vars.fish
