#!/usr/bin/env bash

# Filename: ~/github/dotfiles-latest/colorscheme/colorscheme-selector.sh

# Path to the directory containing color scheme scripts
COLORSCHEME_DIR=~/dotfiles/colorscheme/list

# Path to the colorscheme-set.sh script
COLORSCHEME_SET_SCRIPT=~/dotfiles/zsh/colorscheme-set.sh

# Ensure fzf is installed
if ! command -v fzf &>/dev/null; then
    echo "fzf is not installed. Please install it first."
    exit 1
fi

schemes=($(ls "$COLORSCHEME_DIR"/*.sh | xargs -n 1 basename))

# Check if any schemes are available
if [ ${#schemes[@]} -eq 0 ]; then
    echo "No color scheme scripts found in $COLORSCHEME_DIR."
    exit 1
fi

# Use fzf to select a scheme
selected_scheme=$(printf "%s\n" "${schemes[@]}" | fzf --height=40% --reverse --header="Select a Color Scheme" --prompt="Theme > ")

# Check if a selection was made
if [ -z "$selected_scheme" ]; then
    echo "No color scheme selected."
    exit 0
fi

# Apply the selected color scheme
"$COLORSCHEME_SET_SCRIPT" "$selected_scheme"
