#!/bin/bash

# ----------------------------------------------------- 
# Quit all running waybar instances
# ----------------------------------------------------- 
killall waybar
sleep 0.2

# ----------------------------------------------------- 
# Loading the configuration
# ----------------------------------------------------- 
config_file="config"
style_file="style.css"

# Check used files
echo "Config: $config_file"
echo "Style: $style_file"

waybar -c ~/.config/waybar/$config_file -s ~/.config/waybar/$style_file &
