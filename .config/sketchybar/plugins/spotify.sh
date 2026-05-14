#!/usr/bin/env sh

source "$HOME/.config/sketchybar/colors.sh"

if [ "$SENDER" = "media_change" ]; then
    STATE=$(echo "$INFO" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('state',''))" 2>/dev/null)
    ARTIST=$(echo "$INFO" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('artist',''))" 2>/dev/null)
    TRACK=$(echo "$INFO" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('title',''))" 2>/dev/null)
else
    # Polling fallback via osascript
    RESULT=$(osascript -e 'tell application "Spotify" to get {player state, name of current track, artist of current track}' 2>/dev/null)
    STATE=$(echo "$RESULT" | awk -F', ' '{print $1}')
    TRACK=$(echo "$RESULT" | awk -F', ' '{print $2}')
    ARTIST=$(echo "$RESULT" | awk -F', ' '{print $3}')
fi

if [ "$STATE" = "playing" ]; then
    sketchybar --set spotify drawing=on label="$ARTIST - $TRACK"
else
    sketchybar --set spotify drawing=off
fi
