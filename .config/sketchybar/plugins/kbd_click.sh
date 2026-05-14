#!/usr/bin/env sh

source "$HOME/.config/sketchybar/colors.sh"

LAYOUT=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID 2>/dev/null)

if echo "$LAYOUT" | grep -q "Dvorak"; then
    TARGET="com.apple.keylayout.US"
    NEW_LABEL="qwy"
    NEW_COLOR=$OVERLAY1
else
    TARGET="com.apple.keylayout.Dvorak"
    NEW_LABEL="dvk"
    NEW_COLOR=$MAUVE
fi

~/.local/bin/kbd_switch "$TARGET"
sketchybar --set kbd label="$NEW_LABEL" label.color=$NEW_COLOR
