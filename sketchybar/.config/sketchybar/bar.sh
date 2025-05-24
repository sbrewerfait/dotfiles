#!/usr/bin/env bash

bar=(
    position=top
    height=32
    notch_display_height=43
    blur_radius=30
    color="$BAR_COLOR"
)

sketchybar --bar "${bar[@]}"
