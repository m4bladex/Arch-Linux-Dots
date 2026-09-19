#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
ROFI_THEME="$HOME/.config/rofi/wallpaper.rasi"

# Check wallpaper directory
if [[ ! -d "$WALLPAPER_DIR" ]]; then
    notify-send "Wallpaper Menu" "Directory not found: $WALLPAPER_DIR"
    exit 1
fi

# Check awww
if ! command -v awww >/dev/null 2>&1; then
    notify-send "Wallpaper Menu" "awww is not installed"
    exit 1
fi

# Get wallpaper files
mapfile -d '' wallpapers < <(
    find "$WALLPAPER_DIR" \
        -maxdepth 1 \
        -type f \
        \( \
            -iname "*.png" \
            -o -iname "*.jpg" \
            -o -iname "*.jpeg" \
            -o -iname "*.webp" \
        \) \
        -print0 | sort -z
)

[[ ${#wallpapers[@]} -eq 0 ]] && exit 0

# Build Rofi entries.
# Display = blank-ish filename
# Icon = actual wallpaper image
entries=""

for wallpaper in "${wallpapers[@]}"; do
    name="$(basename "$wallpaper")"

    entries+="${name}\0icon\x1f${wallpaper}\n"
done

# Open Rofi
selected=$(
    printf '%b' "$entries" |
    rofi -dmenu \
        -i \
        -show-icons \
        -theme "$ROFI_THEME" \
        -p "Wallpaper"
)

[[ -z "$selected" ]] && exit 0

# Find selected wallpaper
for wallpaper in "${wallpapers[@]}"; do
    if [[ "$(basename "$wallpaper")" == "$selected" ]]; then

        awww img "$wallpaper"

        # Optional: regenerate Pywal colors
        # wal -i "$wallpaper"

        exit 0
    fi
done