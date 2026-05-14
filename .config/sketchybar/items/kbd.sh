#!/usr/bin/env sh

sketchybar --add item kbd right \
    --subscribe kbd system_keyboardlayout_changed \
    --set kbd \
        update_freq=0 \
        icon.drawing=off \
        label.font="$FONT:Bold:12.0" \
        label.color=$LABEL_COLOR \
        click_script="$PLUGIN_DIR/kbd_click.sh" \
        script="$PLUGIN_DIR/kbd.sh"
