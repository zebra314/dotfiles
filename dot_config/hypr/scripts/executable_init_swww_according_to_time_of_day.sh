#!/bin/sh

swww kill;

# Define directories for morning, afternoon, and evening images
img_dirs=(
  "$HOME/Pictures/Wallpapers/morning"
  "$HOME/Pictures/Wallpapers/afternoon"
  "$HOME/Pictures/Wallpapers/evening"
)

# Get the current hour
hour=$(date +%H)

# Determine the appropriate image directory based on the time of day
if [ "$hour" -ge 5 -a "$hour" -le 12 ]; then
  img_dir=${img_dirs[0]}
elif [ "$hour" -ge 13 -a "$hour" -le 20 ]; then
  img_dir=${img_dirs[1]}
else
  img_dir=${img_dirs[2]}
fi

# Get a random image from the selected directory
img=$(find "$img_dir" -type f | shuf -n 1)

# Initialize swww and set the wallpaper to the selected image
swww init; 
sleep 1;
swww img "$img";