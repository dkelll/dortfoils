#!/usr/bin/env sh

PERCENT=$(pmset -g batt | grep -Eo '[0-9]+%' | head -1 | tr -d '%')
CHARGING=$(pmset -g batt | grep -c 'AC Power')

if [ "$CHARGING" -gt 0 ]; then
    ICON="󰂄"
elif [ "$PERCENT" -ge 80 ]; then
    ICON="󰁹"
elif [ "$PERCENT" -ge 60 ]; then
    ICON="󰂀"
elif [ "$PERCENT" -ge 40 ]; then
    ICON="󰁾"
elif [ "$PERCENT" -ge 20 ]; then
    ICON="󰁼"
else
    ICON="󰁺"
fi

sketchybar --set battery icon="$ICON" label="${PERCENT}%"
