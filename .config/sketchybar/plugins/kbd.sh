#!/usr/bin/env sh

source "$HOME/.config/sketchybar/colors.sh"

LAYOUT=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID 2>/dev/null)

case "$LAYOUT" in
    *Dvorak*) sketchybar --set kbd label="dvk" label.color=$MAUVE ;;
    *)        sketchybar --set kbd label="qwy" label.color=$OVERLAY1 ;;
esac
