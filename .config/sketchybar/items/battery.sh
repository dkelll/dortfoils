#!/usr/bin/env sh

sketchybar --add item battery right \
    --set battery \
        update_freq=60 \
        label.color=$LABEL_COLOR \
        icon.color=$ICON_COLOR \
        script="$PLUGIN_DIR/battery.sh"
