#!/usr/bin/env bash

SPOTIFY_EVENT="com.spotify.client.PlaybackStateChanged"

sketchybar --add event spotify_change $SPOTIFY_EVENT \
    --add item spotify right \
    --set spotify \
    icon="$("$CONFIG_DIR/plugins/icon_map_fn.sh" "Spotify")" \
    icon.color="$ACCENT_COLOR" \
    icon.font="sketchybar-app-font:Regular:16.0" \
    icon.y_offset=1 \
    label.drawing=off \
    label.padding_left=4 \
    script="$PLUGIN_DIR/spotify.sh" \
    --subscribe spotify spotify_change mouse.clicked
