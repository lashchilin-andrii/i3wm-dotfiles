#!/usr/bin/env bash

# 1. Fetch installed tesseract language packs dynamically via pacman
LANGS=$(pacman -Qeq | grep '^tesseract-data-' | sed 's/tesseract-data-//')

# Fallback: if no language packages are found, default to 'eng'
if [ -z "$LANGS" ]; then
    LANGS="eng"
fi

# 2. Open rofi (or dmenu) with the dynamic list
LANG_CHOICE=$(echo "$LANGS" | rofi -dmenu -p "Language:")

# Exit if user cancels or closes the menu
if [ -z "$LANG_CHOICE" ]; then
    exit 0
fi

# 3. Take screenshot and extract text
flameshot gui --raw | tesseract -l "$LANG_CHOICE" stdin stdout | xclip -selection clipboard
