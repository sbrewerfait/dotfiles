#!/usr/bin/env bash

sketchybar --add item aerospace_mode left \
  --subscribe aerospace_mode aerospace_mode_change \
  --set aerospace_mode icon="" \
  script="$CONFIG_DIR/plugins/aerospace_mode.sh" \
  icon.color="$ACCENT_COLOR" \
  icon.padding_left=4 \
  drawing=off

# Query all workspaces with their monitor IDs once
WS_INFO="$(aerospace list-workspaces --json --all --format "%{monitor-appkit-nsscreen-screens-id}%{workspace}")"

# Create items for all workspaces
for sid in $(aerospace list-workspaces --all); do
  # Look up the monitor for this workspace from WS_INFO
  monitor="$(echo "$WS_INFO" \
    | jq -r --arg ws "$sid" '.[] | select(.workspace == $ws) | ."monitor-appkit-nsscreen-screens-id"')"
  monitor_id="$(echo "$WS_INFO" \
    | jq -r --arg ws "$sid" '.[] | select(.workspace == $ws) | ."monitor-appkit-nsscreen-screens-id"')"

  echo "Space: $sid | Monitor: $monitor | Monitor ID: $monitor_id"


  # Fallbacks if somehow missing/null
  if [ -z "$monitor" ] || [ "$monitor" = "null" ]; then
    prior="$(sketchybar --query "space.$sid" 2>/dev/null | jq -r '.display')"
    if [ -n "$prior" ] && [ "$prior" != "null" ]; then
      monitor="$prior"
    else
      # Last resort: focused monitor (optional)
      monitor="$(aerospace list-monitors --json 2>/dev/null | jq -r '.[] | select(.focused==true) | ."appkit-nsscreen-screens-id"')"
      [ -z "$monitor" ] || [ "$monitor" = "null" ] && monitor=1
    fi
  fi

  sketchybar --add item "space.$sid" left \
    --subscribe "space.$sid" aerospace_workspace_change display_change system_woke mouse.entered mouse.exited \
    --set "space.$sid" \
      drawing=off \
      display="$monitor" \
      padding_right=0 \
      icon="$sid" \
      label.padding_right=7 \
      icon.padding_left=7 \
      icon.padding_right=4 \
      background.drawing=on \
      label.font="sketchybar-app-font:Regular:16.0" \
      background.color="$ACCENT_COLOR" \
      icon.color="$BACKGROUND" \
      label.color="$BACKGROUND" \
      background.corner_radius=5 \
      background.height=25 \
      label.drawing=on \
      click_script="aerospace workspace $sid" \
      script="$CONFIG_DIR/plugins/aerospace.sh $sid"
done


# for sid in $(aerospace list-workspaces --all); do
#   monitor=$(aerospace list-windows --workspace "$sid" --format "%{monitor-appkit-nsscreen-screens-id}")
#
#     if [ -z "$monitor" ]; then
#       monitor="1"
#     fi
#   # if [ -z "$monitor" ]; then
#   #   # continue
#   #   monitor="0"
#   # fi
#
#   sketchybar --add item space."$sid" left \
#     --subscribe space."$sid" aerospace_workspace_change display_change system_woke mouse.entered mouse.exited \
#     --set space."$sid" \
#     drawing=off \
#     display="$monitor" \
#     padding_right=0 \
#     icon="$sid" \
#     label.padding_right=7 \
#     icon.padding_left=7 \
#     icon.padding_right=4 \
#     background.drawing=on \
#     label.font="sketchybar-app-font:Regular:16.0" \
#     background.color="$ACCENT_COLOR" \
#     icon.color="$BACKGROUND" \
#     label.color="$BACKGROUND" \
#     background.corner_radius=5 \
#     background.height=25 \
#     label.drawing=on \
#     click_script="aerospace workspace $sid" \
#     script="$CONFIG_DIR/plugins/aerospace.sh $sid"
# done

sketchybar --add item space_separator left \
  --set space_separator icon="|" \
  icon.color="$ACCENT_COLOR" \
  icon.padding_left=4 \
  icon.padding_right=7 \
  label.drawing=off \
  background.drawing=off
