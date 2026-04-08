# ASDF shims — prepend to ensure managed tool versions take precedence
if test -z $asdf_data_dir
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$asdf_data_dir/shims"
end
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

# My preferences
set --export EDITOR hx

# fzf keybindings
which fzf >/dev/null && fzf --fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
fish_add_path $BUN_INSTALL/bin

# Added for Claude Code CLI
fish_add_path "$HOME/.local/bin"

# Pure prompt preferences
set -U pure_symbol_prompt "🍇|>"
set -U pure_symbol_reverse_prompt "🍇<|"
set -U pure_reverse_prompt_symbol_in_vimode true
set -U pure_enable_aws_profile true
set -U pure_enable_k8s false
set -U pure_check_for_new_release false

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
