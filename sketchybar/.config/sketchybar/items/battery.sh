#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

sketchybar --add item battery right \
    --set battery \
    update_freq=30 \
    script="$PLUGIN_DIR/battery.sh"

sketchybar --add item space_separator_battery right \
  --set space_separator_battery icon="|" \
  icon.color="$ACCENT_COLOR" \
  icon.padding_left=1 \
  icon.padding_right=7 \
  label.drawing=off \
  background.drawing=off
