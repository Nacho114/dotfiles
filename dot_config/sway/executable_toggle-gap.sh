#!/usr/bin/env bash

# Default gap settings
gap_inner_open=0
gap_outer_open=0
gap_inner_closed=30
gap_outer_closed=70

# Get the current lid state
lid_state=$(grep -oP '(?<=state:\s{6})\w+' /proc/acpi/button/lid/LID/state)

# Check the lid state and set gaps accordingly
if [ "$lid_state" == "open" ]; then
    swaymsg gaps inner all set $gap_inner_open
    swaymsg gaps outer all set $gap_outer_open
else
    swaymsg gaps inner all set $gap_inner_closed
    swaymsg gaps outer all set $gap_outer_closed
fi
