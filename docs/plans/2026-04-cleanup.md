# Dotfiles Cleanup — April 2026

**Status:** Pending  
**Goal:** Prepare dotfiles for a new machine by removing unused tool configs, fixing Fish config inconsistencies, and updating the linking script.

## Decisions

| Area | Decision |
|------|----------|
| Shell | Fish only — remove Zsh, Bash, Oh My Zsh |
| Editor | Helix only — remove Vim and Neovim |
| Terminal | Ghostty only — remove Kitty and WezTerm |
| Brewfile | Delete entirely |

See `docs/adr/` for the reasoning behind each decision.

---

## Phase 1 — Remove Unused Tool Configs

### Files/directories to delete
- `zshrc` — no longer primary shell
- `bashrc` — unused legacy
- `vimrc` — no longer using Vim
- `asdfrc` — verify if Fish/ASDF still needs this; delete if not referenced
- `_Brewfile` — confirmed delete
- `vim/` — entire directory (~89MB of plugins + legacy vimconfig)
- `_zsh-custom/` — entire directory (Oh My Zsh customizations, themes, plugins)
- `_configuration/kitty/` — removing Kitty
- `_configuration/wezterm/` — removing WezTerm
- `_configuration/nvim/` — removing Neovim (includes stale `init.vim.bak`)

### Git submodules to remove

For each submodule: `git submodule deinit -f <path>` → `git rm -f <path>` → `rm -rf .git/modules/<path>`

1. `oh-my-zsh/`
2. `_zsh-custom/themes/spaceship-prompt`
3. `_zsh-custom/plugins/zsh-autosuggestions`
4. `_zsh-custom/plugins/zsh-syntax-highlighting`
5. `_zsh-custom/plugins/history-substring-search`

**Keep:** `tpm/` submodule (Tmux Plugin Manager — unrelated to shell choice)

---

## Phase 2 — Fix Fish Config

### 2a. Remove `fish_variables` from the repo

`fish_variables` is Fish's runtime state store. It mixes three things that should not be tracked:
- Generated Fisher manifests (`_fisher_*_files`) — recreated on every `fisher update`
- Device-specific paths (`/Users/lsparlin/.codeium/windsurf/bin`, z jump history)
- Fish's own internal version marker (`__fish_initialized`)

**Action:** Remove `_configuration/fish/fish_variables` from the repo and add it to `.gitignore`.

The `fish_plugins` file (already tracked) is the correct artifact for plugin management — no need for `fish_variables`.

### 2b. Extract Pure prompt settings into `config.fish`

The Pure configuration in `fish_variables` (lines 16–87) contains real preferences worth preserving — but as code, not as a managed file. Move them to `config.fish` as `set -U` calls so they apply idempotently on first launch.

Only port the non-default values (i.e., settings that differ from Pure's own defaults):
```fish
# Pure prompt preferences
set -U pure_symbol_prompt "🍇|>"
set -U pure_symbol_reverse_prompt "🍇<|"
set -U pure_reverse_prompt_symbol_in_vimode true
set -U pure_enable_aws_profile true
set -U pure_enable_k8s false
set -U pure_check_for_new_release false
```

> Review the full list in the current `fish_variables` and carry over only intentional customizations — most of the `pure_color_*` entries are Pure's own defaults and don't need to be set explicitly.

### 2c. Fix `config.fish` path setup

**File:** `_configuration/fish/config.fish`

Issues to fix:
1. **Remove empty interactive block** (lines 1–3) — placeholder with no contents
2. **Clean up ASDF comment noise** — remove the multi-line "tried this / also tried this" comments; keep only the working approach
3. **Replace bash-style `export PATH=`** with Fish-native syntax (`fish_add_path`)
4. **Remove `fish_add_path /Applications/Obsidian.app/Contents/MacOS`** — move to `fish_user_paths` management or keep only in one place
5. **Standardize PATH additions** — use `fish_add_path` for one-time paths; reserve `set -gx --prepend PATH` for ASDF shims only (ordering is critical there)

Clean target:
```fish
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

# fzf keybindings
which fzf >/dev/null && fzf --fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
fish_add_path $BUN_INSTALL/bin

# Pure prompt preferences
set -U pure_symbol_prompt "🍇|>"
set -U pure_symbol_reverse_prompt "🍇<|"
set -U pure_reverse_prompt_symbol_in_vimode true
set -U pure_enable_aws_profile true
set -U pure_enable_k8s false
set -U pure_check_for_new_release false
```

---

## Phase 3 — Update `_link_dotfiles` Script

**File:** `_link_dotfiles`

Remove all references to deleted tools:
- Symlink targets: `zshrc`, `bashrc`, `vimrc`, `_Brewfile`
- Config dirs: `nvim`, `kitty`, `wezterm`
- Any Oh My Zsh / `_zsh-custom` linking logic
- Update "deprecated if I start using fish shell" comments — fish is now primary

Remaining links should cover:
- Root dotfiles: `gitconfig`, `gitignore`, `tmux.conf`, `tool-versions`
- `~/.config/` dirs: `fish` (via `fish/`), `helix`, `ghostty`, `bat` (if present)
- Ensure `fish_variables` is **not** linked — it should be generated locally by Fish/Fisher

---

## Phase 4 — Clean Up Repo Metadata

- **`.gitmodules`** — verify all removed submodule entries are gone after Phase 1
- **`README.md`** — update tool list to reflect Fish/Helix/Ghostty stack; remove Zsh, Vim/Neovim, Kitty, WezTerm
- **`CLAUDE.md`** — update Repository Overview and Tool-Specific Notes to match current stack
- **`tool-versions`** — confirm whether Elixir 1.13.4 / Erlang 23.3.4.15 are still needed
  - Elixir and Erland are NOT needed any longer

---

## Verification

1. **Dry-run link script**: `./_link_dotfiles` — confirm output only references current tools
2. **Check submodules**: `git submodule status` — should only show `tpm`
3. **Check repo size**: `du -sh .` — should be significantly smaller without `vim/`
4. **Validate Fish config**: Source `config.fish`, run `echo $PATH` — confirm no duplicate entries
5. **Spot-check symlinks**: After `./_link_dotfiles live`, verify:
   - `~/.gitconfig`
   - `~/.config/fish/config.fish`
   - `~/.config/helix/config.toml`
   - `~/.config/ghostty/config`
6. **Commit**: Single cleanup commit summarizing what was removed
