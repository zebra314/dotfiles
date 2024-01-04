#!/bin/sh

sleep 5;

# Get the path of the image
img_path=$(cat ~/.cache/swww/eDP-1)

# Use the path to set the pywal color scheme
wal -i "$img_path" -n

# Update firefox theme
pywalfox update