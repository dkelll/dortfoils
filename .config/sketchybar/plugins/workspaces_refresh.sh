#!/usr/bin/env sh

source "$HOME/.config/sketchybar/colors.sh"

sleep 0.05

FOCUSED="${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused 2>/dev/null)}"

# Build entire sketchybar command in one awk pass — no shell loop
eval "sketchybar $(aerospace list-windows --all --format '%{workspace}' 2>/dev/null \
    | awk -v focused="$FOCUSED" \
          -v active_color="$WORKSPACE_ACTIVE_COLOR" \
          -v active_bg="$WORKSPACE_ACTIVE_BG" \
          -v occupied_color="$WORKSPACE_OCCUPIED_COLOR" \
    '
    { count[$1]++ }
    END {
        split("1 2 3 4 5 6 7 8 9 0", ws, " ")
        for (i=1; i<=10; i++) {
            s = ws[i]
            if (s == focused)
                printf "--set space.%s drawing=on label.color=%s background.drawing=on background.color=%s ", s, active_color, active_bg
            else if (count[s] > 0)
                printf "--set space.%s drawing=on label.color=%s background.drawing=off ", s, occupied_color
            else
                printf "--set space.%s drawing=off ", s
        }
    }
    ')"
