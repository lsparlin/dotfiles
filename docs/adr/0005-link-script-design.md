# 5. Link Script Design Decisions

Date: 2026-04-01
Status: Amended by 0006

## Context

The `_link_dotfiles` script (now `scripts/link_dotfiles`) had three issues that accumulated over time:

1. `DOTFILES_DIR=$(realpath)` resolves the *current working directory*, not the script's location. Running the script from any directory other than the dotfiles root produced wrong symlink paths.
2. Each symlink target was listed twice — once in an `echo` block for dry-run and once in an `ln` block for live mode. Adding a new tool required two edits and it was easy for them to drift out of sync.
3. Exclusions in `list_linkable_dotfiles` used substring `sed` matches (`sed "/docs/d"`), which would silently swallow any filename containing the substring (e.g. "documents" being excluded by a "docs" filter).

## Decision

**1. Script-relative path resolution**
Use `$(realpath "$(dirname "$0")")` so `DOTFILES_DIR` always resolves to the directory containing the script, regardless of where it is invoked from.

**2. `link()` helper for single-declaration targets**
Define a `link()` function that checks `$DRY_RUN` and either prints intent or executes. Each explicit config target (ghostty, helix, bat, fish files) is declared once as a `link` call — no duplication between dry-run and live branches.

The root dotfile loop (which uses `xargs`) remains in separate if/else branches since it uses a different invocation pattern, but all explicit named targets use the helper.

**3. Anchored grep exclusions**
Replace multiple `sed` substring filters with a single `grep -vE` with anchored exact matches:
```bash
grep -vE '^(README\.md|CLAUDE\.md|docs|scripts|tpm|_configuration|_link_dotfiles|\..*)'
```
The `^` anchor ensures only exact filename prefixes match, not substrings.

Note: this exclusion list was later eliminated entirely by the `HOME/` restructure described in ADR 0006.

## Consequences

- The script can be run from any directory (e.g. `~/dotfiles/scripts/link_dotfiles` from `~`)
- Adding a new app config requires one line in the script, not two
- Exclusions are explicit and safe — a file named "documents" won't be accidentally excluded
- The `link()` helper is defined once and reused for all explicit targets
