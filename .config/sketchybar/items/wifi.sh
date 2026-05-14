#!/usr/bin/env sh

sketchybar --add item wifi right \
    --subscribe wifi wifi_change \
    --set wifi \
        update_freq=30 \
        label.color=$LABEL_COLOR \
        icon.color=$ICON_COLOR \
        script="$PLUGIN_DIR/wifi.sh"
