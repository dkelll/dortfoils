#!/usr/bin/env sh

sleep 0.1

FOCUSED="${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused 2>/dev/null)}"

for sid in 1 2 3 4 5 6 7 8 9 0; do
    FOCUSED_WORKSPACE="$FOCUSED" NAME="space.$sid" "$HOME/.config/sketchybar/plugins/workspace.sh" "$sid"
done
