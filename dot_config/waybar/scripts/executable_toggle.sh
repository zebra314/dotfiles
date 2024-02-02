#!/bin/bash

if pgrep -x "waybar" > /dev/null
then
    # echo "Waybar is running."
    killall waybar;
else
    # echo "Waybar failed to start."
    ~/.config/waybar/scripts/launch.sh
fi
