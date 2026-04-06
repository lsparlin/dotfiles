#!/bin/sh
input=$(cat)

# ANSI color codes
RESET='\033[0m'
BOLD='\033[1m'
DIM='\033[2m'

# Colors
BLUE='\033[34m'
CYAN='\033[36m'
GREEN='\033[32m'
YELLOW='\033[33m'
MAGENTA='\033[35m'
RED='\033[31m'

# Current directory shortened with ~
dir=$(echo "$input" | jq -r '.cwd')
home="$HOME"
short_dir="${dir/#$home/\~}"

# Git branch (skip optional lock to avoid conflicts)
branch=$(git -C "$dir" --no-optional-locks branch --show-current 2>/dev/null)

# Model display name
model=$(echo "$input" | jq -r '.model.display_name')

# Context remaining percentage
remaining=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')

# Build status line with colors
# Model in bold cyan
line="${BOLD}${CYAN}[${model}]${RESET}"
line="$line${DIM} │ ${RESET}"

# Git branch in green
[ -n "$branch" ] && line="$line${GREEN}🌿 ${branch}${RESET}${DIM} │ ${RESET}"

# Directory in yellow
line="$line${YELLOW}${short_dir}${RESET}"

# Context remaining in magenta (with color based on usage)
if [ -n "$remaining" ]; then
  remaining_int=$(printf '%.0f' "$remaining")
  if [ "$remaining_int" -lt 20 ]; then
    ctx_color="${RED}"
  elif [ "$remaining_int" -lt 50 ]; then
    ctx_color="${YELLOW}"
  else
    ctx_color="${GREEN}"
  fi
  line="$line${DIM} │ ${RESET}${DIM}ctx:${RESET} ${ctx_color}${remaining_int}%${RESET}"
fi

printf '%b\n' "$line"
