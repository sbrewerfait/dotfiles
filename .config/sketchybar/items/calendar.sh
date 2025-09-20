#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

sketchybar --add item calendar right \
    --set calendar icon=󰃰 \
    update_freq=30 \
    script="$PLUGIN_DIR/calendar.sh"

sketchybar --add item space_separator_calendar right \
  --set space_separator_calendar icon="|" \
  icon.color="$ACCENT_COLOR" \
  icon.padding_left=1 \
  icon.padding_right=7 \
  label.drawing=off \
  background.drawing=off
