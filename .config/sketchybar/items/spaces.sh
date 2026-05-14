#!/usr/bin/env sh

sketchybar --add event aerospace_workspace_change

FOCUSED=$(aerospace list-workspaces --focused)

for sid in 1 2 3 4 5 6 7 8 9 0; do
    sketchybar --add item "space.$sid" left \
        --subscribe "space.$sid" aerospace_workspace_change front_app_switched \
        --set "space.$sid" \
            label="$sid" \
            label.font="$FONT:Bold:12.0" \
            label.padding_left=8 \
            label.padding_right=8 \
            icon.drawing=off \
            background.height=22 \
            background.corner_radius=6 \
            background.drawing=off \
            drawing=off \
            click_script="aerospace workspace $sid" \
            script="$PLUGIN_DIR/workspace.sh $sid"

    # Set initial state immediately — don't wait for a workspace change event
    FOCUSED_WORKSPACE="$FOCUSED" NAME="space.$sid" "$PLUGIN_DIR/workspace.sh" "$sid"
done
