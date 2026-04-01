# Structure & Link Script Improvements

**Status:** Pending  
**Goal:** Clean up naming inconsistencies, separate config files from utility scripts, and fix correctness/maintainability issues in `_link_dotfiles`.

---

## Phase 1 — Rename `fish/` → `fish/`

The `_things` suffix is vestigial. The link script links individual files out of this directory (not the directory itself), so there's no naming conflict with `~/.config/fish/`.

**Steps:**
1. `git mv _configuration/fish _configuration/fish`
2. Update `_link_dotfiles` — replace all occurrences of `fish` with `fish`
3. Update `CLAUDE.md` — update the path reference in the Fish Shell section

---

## Phase 2 — Move Utility Scripts to `scripts/`

`_configuration/` should contain only things that get symlinked. Currently it also holds one-off setup scripts and terminfo data files. Move them to a dedicated `scripts/` directory at the repo root.

**Files to move:**
- `_configuration/init_screenshot_dir` → `scripts/init_screenshot_dir`
- `_configuration/install_fisher` → `scripts/install_fisher`
- `_configuration/install_homebrew` → `scripts/install_homebrew`
- `_configuration/install_italic_terms` → `scripts/install_italic_terms`
- `_configuration/link_icloud_drive_obsidian` → `scripts/link_icloud_drive_obsidian`
- `_configuration/tmux-256color-italic.terminfo` → `scripts/tmux-256color-italic.terminfo`
- `_configuration/xterm-256color-italic.terminfo` → `scripts/xterm-256color-italic.terminfo`

**Steps:**
1. `mkdir scripts/`
2. `git mv` each file above
3. Update `README.md` — change the "Other helpers" paths from `_configuration/` to `scripts/`

---

## Phase 3 — Fix `_link_dotfiles`

Three issues to address:

### 3a. Fix `$(realpath)` bug

**File:** `_link_dotfiles`, line 9

Current:
```zsh
DOTFILES_DIR=$(realpath)
```

This resolves the current working directory, not the script's location. Running the script from outside the dotfiles directory will produce wrong paths.

Replace with:
```zsh
DOTFILES_DIR=$(realpath "$(dirname "$0")")
```

### 3b. Deduplicate dry-run / live logic with a `link` helper

Currently, adding a new tool requires updating both the `if $DRY_RUN` echo block and the `else` ln block. Extract a helper so each symlink is declared once:

```zsh
link() {
  # usage: link <source> <dest>
  if $DRY_RUN; then
    echo "Would link $fg_bold[green]$2$reset_color -> $fg[blue]$1$reset_color"
  else
    ln -fvhsn "$1" "$2"
  fi
}
```

Then each target becomes a single call:
```zsh
link "$DOTFILES_DIR/_configuration/ghostty"          "$HOME/.config/ghostty"
link "$DOTFILES_DIR/_configuration/helix"            "$HOME/.config/helix"
link "$DOTFILES_DIR/_configuration/bat"              "$HOME/.config/bat"
link "$DOTFILES_DIR/_configuration/fish/fish_plugins" "$HOME/.config/fish/fish_plugins"
link "$DOTFILES_DIR/_configuration/fish/config.fish"  "$HOME/.config/fish/config.fish"
```

The root dotfile loop can stay as-is (it's already a single path).

### 3c. Harden the sed exclusion list

The current approach uses substring matching — `/docs/d` would silently swallow a file named `documents`. Replace with anchored exact matches:

```zsh
function list_linkable_dotfiles {
  ls -1 "$DOTFILES_DIR" \
    | grep -vE '^(README\.md|CLAUDE\.md|docs|scripts|tpm|_configuration|_link_dotfiles|\..*)'
}
```

This uses a positive exclusion regex anchored to the start of the filename, making each exclusion explicit and safe.

---

## Verification

1. **Dry-run the link script from a different directory**: `cd ~ && ~/dotfiles/_link_dotfiles` — confirm output paths are correct (previously would have resolved to `~` instead of the dotfiles dir)
2. **Confirm fish config still links**: `./_link_dotfiles` — should show `~/.config/fish/...` pointing to `_configuration/fish/` (not `fish/`)
3. **Confirm scripts/ exists and contains all moved files**: `ls scripts/`
4. **Confirm `_configuration/` contains only config dirs**: `ls _configuration/` — should only show `bat`, `fish`, `ghostty`, `helix`
5. **Commit**

---

## ADR Todos

Write the following ADRs after implementing the changes above:

- [ ] `docs/adr/0004-configuration-directory-convention.md` — Why `_configuration/` contains only symlink targets (not scripts); the invariant this establishes and why scripts/ is separate
- [ ] `docs/adr/0005-link-script-design.md` — The `link()` helper pattern; why a single declaration per target is better than duplicated dry-run/live blocks; the `$(dirname "$0")` fix and why it matters
