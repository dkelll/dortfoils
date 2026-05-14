#!/usr/bin/env sh

# Catppuccin Macchiato
# https://github.com/catppuccin/catppuccin
ROSEWATER=0xfff4dbd6
FLAMINGO=0xfff0c6c6
PINK=0xfff5bde6
MAUVE=0xffc6a0f6
RED=0xffed8796
MAROON=0xffee99a0
PEACH=0xfff5a97f
YELLOW=0xffeed49f
GREEN=0xffa6da95
TEAL=0xff8bd5ca
SKY=0xff91d7e3
SAPPHIRE=0xff7dc4e4
BLUE=0xff8aadf4
LAVENDER=0xffb7bdf8
TEXT=0xffcad3f5
SUBTEXT1=0xffb8c0e0
SUBTEXT0=0xffa5adcb
OVERLAY2=0xff939ab7
OVERLAY1=0xff8087a2
OVERLAY0=0xff6e738d
SURFACE2=0xff5b6078
SURFACE1=0xff494d64
SURFACE0=0xff363a4f
BASE=0xff24273a
MANTLE=0xff1e2030
CRUST=0xff181926
TRANSPARENT=0x00000000

# Bar
BAR_COLOR=$BASE
BAR_BORDER_COLOR=$SURFACE0

# Text
ICON_COLOR=$TEXT
LABEL_COLOR=$TEXT

# Workspaces
WORKSPACE_ACTIVE_COLOR=$TEXT        # white — active workspace
WORKSPACE_OCCUPIED_COLOR=$OVERLAY1  # grey — has windows, not active
WORKSPACE_ACTIVE_BG=$SURFACE1       # pill background when active

# Popups
POPUP_BACKGROUND_COLOR=$MANTLE
POPUP_BORDER_COLOR=$SURFACE2

# ── Border colors (JankyBorders) ─────────────────────────────────────────────
# Change BORDER_ACTIVE to any color above to restyle quickly
BORDER_ACTIVE=$MAUVE        # focused window  — Catppuccin Mauve
BORDER_INACTIVE=$SURFACE1   # unfocused window — dark grey
BORDER_WIDTH=10
