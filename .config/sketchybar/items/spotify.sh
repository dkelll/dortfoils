#!/usr/bin/env sh

sketchybar --add item spotify right \
    --subscribe spotify media_change \
    --set spotify \
        update_freq=10 \
        updates=on \
        icon.drawing=off \
        label.font="$FONT:Regular:12.0" \
        label.color=$OVERLAY1 \
        label.max_chars=30 \
        width=200 \
        scroll_texts=on \
        drawing=off \
        script="$PLUGIN_DIR/spotify.sh"
