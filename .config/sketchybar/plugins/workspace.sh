#!/usr/bin/env sh

source "$HOME/.config/sketchybar/colors.sh"

WS="$1"
FOCUSED="${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused 2>/dev/null)}"

WIN_COUNT=$(aerospace list-windows --workspace "$WS" 2>/dev/null | wc -l | tr -d ' ')

if [ "$WS" = "$FOCUSED" ]; then
    sketchybar --set "$NAME" \
        drawing=on \
        label.color=$WORKSPACE_ACTIVE_COLOR \
        background.drawing=on \
        background.color=$WORKSPACE_ACTIVE_BG
elif [ "$WIN_COUNT" -gt 0 ]; then
    sketchybar --set "$NAME" \
        drawing=on \
        label.color=$WORKSPACE_OCCUPIED_COLOR \
        background.drawing=off
else
    sketchybar --set "$NAME" drawing=off
fi
