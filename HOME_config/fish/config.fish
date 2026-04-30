# My preferences
fish_vi_key_bindings
fish_config theme choose dracula
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

# Machine-specific config (not tracked in git)
if test -f $HOME/.local.fish
    source $HOME/.local.fish
end
