#!/bin/sh

PLUGIN_SHARED_DIR="/Users/sbrewer/.config/sketchybar/plugins"

front_app=(
  label.font="$FONT:Black:15.0"
  icon.background.drawing=on
  display=active
  script="$PLUGIN_SHARED_DIR/front_app.sh"
  click_script="open -a 'Mission Control'"
)
sketchybar --add item front_app left         \
           --set front_app "${front_app[@]}" \
           --subscribe front_app front_app_switched
