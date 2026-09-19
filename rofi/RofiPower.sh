#!/usr/bin/env bash

# CMDs
uptime_info=$(uptime -p | sed -e 's/up //g')
host=$(hostnamectl hostname)

# Options with Icons and Text
options=("Lock" "Suspend" "Logout" "Reboot" "Shutdown" "Hibernate")
icons=("" "" "󰿅" "󱄌" "" "󰒲")

# Rofi CMD
rofi_cmd() {
    options_with_icons=()
    for idx in "${!options[@]}"; do
        options_with_icons+=("${icons[$idx]} ${options[$idx]}")
    done

    printf "%s\n" "${options_with_icons[@]}" | \
    rofi -dmenu -i -p " $USER@$host" -mesg " Uptime: $uptime_info" \
    -theme ~/.config/rofi/config-powermenu.rasi
}

# Execute Command
run_cmd() {
    local icon=$(echo "$1" | awk '{print $1}')

    case $icon in
        "")
            hyprlock
            ;;
        "")
            hyprlock & systemctl suspend
            ;;
        "󰿅")
            labwc --exit
            ;;
        "󱄌")
            systemctl reboot
            ;;
        "")
            systemctl poweroff
            ;;
        "󰒲")
            systemctl hibernate
            ;;
        *)
            ;;
    esac
}

# Actions
chosen_option=$(rofi_cmd)
if [[ -n "$chosen_option" ]]; then
    run_cmd "$chosen_option"
fi
