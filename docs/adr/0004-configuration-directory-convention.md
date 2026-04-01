# 4. Configuration Directory Contains Only Symlink Targets

Date: 2026-04-01
Status: Accepted

## Context

The `_configuration/` directory originally held two unrelated types of content: app config directories that get symlinked to `~/.config/` (fish, helix, ghostty, bat), and one-off utility scripts that are run manually during setup (install_fisher, install_homebrew, init_screenshot_dir, etc.), along with terminfo data files. This made the directory's purpose ambiguous — it wasn't clear what belonged there or what the `_link_dotfiles` script would pick up.

## Decision

`_configuration/` contains only directories that are symlinked to `~/.config/<appname>/` by the link script. Utility scripts and setup helpers live in `scripts/` at the repo root.

The invariant: if it's in `_configuration/`, the link script symlinks it. If the link script doesn't touch it, it doesn't belong in `_configuration/`.

## Consequences

- `_configuration/` is predictable — its contents map 1:1 to `~/.config/` entries
- New app configs can be added to `_configuration/` and the link script without ambiguity
- Setup scripts in `scripts/` are clearly manual/one-time operations, not managed symlinks
- The `_link_dotfiles` script exclusion logic no longer needs to account for non-config items inside `_configuration/`
