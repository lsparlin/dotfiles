#!/bin/zsh
autoload colors; colors

DRY_RUN=true
if [ "$1" = "live" ]; then
  DRY_RUN=false
fi

DOTFILES_DIR=$(dirname $file)
UNDERSCORE_PATTERN="^_" #  to exclude files beginning with _(underscore)

# Files that should be linked to $HOME as dotfiles
function list_linkable_dotfiles {
  ls -l1 $DOTFILES_DIR |\
    sed "/README/d" |\
    sed -E "/$UNDERSCORE_PATTERN/d"
}

# Files that should be linked to $HOME as-is
function list_linkable_files {
  echo "_Brewfile" | sed -E "s/$UNDERSCORE_PATTERN//"
}

if $DRY_RUN; then
  echo "$fg_bold[green]DRY RUN$reset_color"
  echo "_______"

  list_linkable_dotfiles |\
    xargs -I% echo "Would link $fg_bold[green]~/.%$reset_color -> $fg[blue]./%$reset_color"
  list_linkable_files|\
    xargs -I% echo "Would link $fg_bold[green]~/%$reset_color -> $fg[blue]./_%$reset_color"

  echo "_______"

else
  list_linkable_dotfiles | xargs -I% ln -fvhs $DOTFILES_DIR/% $HOME/.%
  list_linkable_files | xargs -I% ln -fvhs $DOTFILES_DIR/_% $HOME/%

  # ~/.tmux.conf is the expected location for tmux config
  ln -fvhs $DOTFILES_DIR/tmux/.tmux.conf $HOME/.tmux.conf

  # ohmyzsh looks for theme files in $ZSH_CUSTOM/themes
  ln -fvhs $DOTFILES_DIR/_zsh-custom/themes/spaceship-prompt/spaceship.zsh $DOTFILES_DIR/_zsh-custom/themes/spaceship.zsh-theme
fi
