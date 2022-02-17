#!/bin/zsh
# this is auto-run because it is in the ZSH_CUSTOM directory

function mac-notify() {
  MESSAGE=${1:-[No Message]}
  osascript -e "display notification \"$MESSAGE\" with title \"CLI Message\" sound name \"Pop\""
}

function watchp() {
# watch the last command (excludes itself)
  WATCH_S=${1:-10}

  fc -ln -5 | \
		grep -ve '^watchp' | \
		tail -1 | \
		xargs -I{} watch -n $WATCH_S {}
}

alias prevcmd="fc -ln -5 | grep -ve '^prevcmd' -ve '^fc ' | tail -1"
function prevcmd_to_alias() {
  if [[ $# -lt 1 ]]; then
		echo "Enter alias name as parameter"
		return 1
	fi

	prevcmd | xargs -I{} echo "alias $1=\"{}\""
}
