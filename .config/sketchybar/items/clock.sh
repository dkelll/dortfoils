#!/usr/bin/env sh

# position "q" = POSITION_CENTER_LEFT  — flows right-to-left from left edge of notch
# position "e" = POSITION_CENTER_RIGHT — flows left-to-right from right edge of notch

sketchybar --add item clock.time q \
    --set clock.time \
        update_freq=10 \
        icon.drawing=off \
        label.font="$FONT:Bold:13.0" \
        label.color=$LABEL_COLOR \
        script="$PLUGIN_DIR/clock.sh"

sketchybar --add item clock.date e \
    --set clock.date \
        update_freq=60 \
        icon.drawing=off \
        label.font="$FONT:Regular:13.0" \
        label.color=$LABEL_COLOR \
        click_script="$PLUGIN_DIR/date_click.sh" \
        script="$PLUGIN_DIR/clock.sh"
