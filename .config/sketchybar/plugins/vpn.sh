#!/usr/bin/env sh

source "$HOME/.config/sketchybar/colors.sh"

CONNECTED=$(netstat -rn 2>/dev/null | awk '/^default.*utun4/{print $1}')

if [ -n "$CONNECTED" ]; then
    sketchybar --set vpn icon="󰒃" label="VPN" icon.color=$GREEN label.color=$GREEN
else
    sketchybar --set vpn icon="󰒄" label="VPN" icon.color=$RED label.color=$RED
fi
