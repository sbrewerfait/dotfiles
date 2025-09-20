#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

sketchybar --add item space_separator_left left \
  --set space_separator_left icon="|" \
  drawing=on \
  icon.color="$ACCENT_COLOR" \
  icon.padding_left=4 \
  icon.padding_right=7 \
  label.drawing=off \
  background.drawing=off
