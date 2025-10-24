#!/usr/bin/env bash

bar=(
    position=top
    height=32
    # notch_display_height=68
    notch_display_height=39
    blur_radius=30
    color="$PURPLE_BAR_COLOR"
)

sketchybar --bar "${bar[@]}"

