#!/bin/bash

# Wi-Fi
wifi="--"
iface=$(ip route | awk '/default/ {print $5; exit}')

if [[ "$iface" == wl* ]] && command -v iw >/dev/null 2>&1; then
    signal=$(iw dev "$iface" link 2>/dev/null | awk '/signal:/ {print int($2); exit}')
    if [[ -n "$signal" ]]; then
        wifi=$(( (signal + 90) * 100 / 60 ))
        (( wifi > 100 )) && wifi=100
        (( wifi < 0 )) && wifi=0
    fi
fi

# Battery
battery=$(cat /sys/class/power_supply/BAT1/capacity 2>/dev/null || echo "--")

# RAM
ram=$(free | awk '/Mem:/ {printf "%d", ($3/$2)*100}')

# CPU
cpu=$(top -bn1 2>/dev/null | awk -F',' '
/Cpu\(s\)/ {
    for (i=1; i<=NF; i++) {
        if ($i ~ /id/) {
            gsub(/[^0-9.]/, "", $i)
            printf "%d", 100-$i
            exit
        }
    }
}')

# Clock
clock=$(date '+%H:%M')

printf '󰤨 %s%%    󰁹 %s%%    RAM %s%%    CPU %s%%    󰥔 %s\n' \
    "$wifi" "$battery" "$ram" "$cpu" "$clock"
