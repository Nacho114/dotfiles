#!/usr/bin/env bash

# Function to check if swayidle is running
check_swayidle() {
    pgrep swayidle > /dev/null && echo "Idle: on" || echo "Idle: off"
}

# Get the current date and time
date=$(date "+%R\t%a %F")

# Get volume and mute status
read -r volume_level mute_status <<< $(amixer get Master | awk -F'[][]' '/Right:/ { vol=$2; mute=$4 } END { print vol, mute }')
volume_display=$([ "$mute_status" == "off" ] && echo "$volume_level muted" || echo "$volume_level")

# Get battery status
battery=$(acpi | awk -F', ' '/Battery 0/ {print $2}')

# Get Wi-Fi status
wifi=$(nmcli -t -f WIFI g)
if [ "$wifi" = "enabled" ]; then
    wifi_connection="on"
    # wifi_connection=$(nmcli -t -f NAME c show --active | head -n 1)
    wifi_status=$([ -z "$wifi_connection" ] && echo "not connected" || echo "$wifi_connection")
else
    wifi_status="disabled"
fi

# Get idle status
idle_status=$(check_swayidle)

# Print the status bar
echo -e "$date\t\t\t\t\t V: $volume_display | B: $battery | W: $wifi_status | $idle_status "

