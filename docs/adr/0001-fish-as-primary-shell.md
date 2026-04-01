# 1. Fish as Primary Shell

Date: 2026-04-01  
Status: Accepted

## Context

The dotfiles repo historically configured both Zsh (with Oh My Zsh) and Fish shell. Fish had been added incrementally while Zsh remained the default, leaving both fully configured with overlapping functionality (aliases, prompt themes, plugin managers, PATH setup). The Oh My Zsh submodule alone added ~23MB to the repo, plus three additional plugin submodules. Maintaining both shells created drift — changes made in one weren't reflected in the other.

## Decision

Fish is the primary (and only) shell going forward. Zsh, Bash, and Oh My Zsh configurations are removed from the repo.

Fish was chosen because:
- It was already the shell in active daily use
- The `_link_dotfiles` script contained a comment explicitly noting zsh was "deprecated if I start using fish shell"
- Fish provides autosuggestions, syntax highlighting, and a sane scripting syntax without requiring a framework like Oh My Zsh
- Fewer moving parts: Fisher plugins replace Oh My Zsh + submodule plugins

## Consequences

- `zshrc`, `bashrc`, `_zsh-custom/`, and the `oh-my-zsh` submodule are deleted
- Any machine that relied on the Zsh config from this repo will need Fish installed instead
- Oh My Zsh-specific features (spaceship prompt, zsh plugins) are no longer available via this repo
