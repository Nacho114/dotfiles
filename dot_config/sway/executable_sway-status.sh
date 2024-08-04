#!/usr/bin/env bash

# Get the current date and time
date=$(date "+%a %F %R")

# Get volume and mute status
volume=$(amixer get Master | awk -F'[][]' '/Right:/ { vol=$2; mute=$4 } END { print vol, mute }')
volume_level=$(echo $volume | awk '{print $1}')
mute_status=$(echo $volume | awk '{print $2}')
if [ "$mute_status" == "off" ]; then
    volume_display="$volume_level muted"
else
    volume_display="$volume_level"
fi

# Get battery status
battery=$(acpi | grep "Battery 0" | awk -F', ' '{print $2}')

# Get Wi-Fi status
wifi=$(nmcli -t -f WIFI g)
if [ "$wifi" = "enabled" ]; then
    wifi_connection="on"
    if [ -z "$wifi_connection" ]; then
        wifi_status="not connected"
    else
        wifi_status="$wifi_connection"
    fi
else
    wifi_status="disabled"
fi

# Print the status bar
echo -e "$date\t| V: $volume_display | B: $battery | W: $wifi_status "

