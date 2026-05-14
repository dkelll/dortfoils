#!/usr/bin/env sh

sketchybar --add item vpn right \
    --set vpn \
        update_freq=15 \
        updates=on \
        icon.color=$ICON_COLOR \
        label.color=$LABEL_COLOR \
        script="$PLUGIN_DIR/vpn.sh"
