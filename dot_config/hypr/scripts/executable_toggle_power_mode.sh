#!/bin/sh

# Get the current power profile
current_profile=$(powerprofilesctl list | grep '*' | awk '{print $2}')

# Remove trailing character ":"
current_profile=${current_profile%?}

# Define the order of the power profiles
profiles=("performance" "power-saver" "balanced")

# Find the index of the current power profile in the array
index=0
for i in "${!profiles[@]}"; do
   if [[ "${profiles[$i]}" = "${current_profile}" ]]; then
     index=$i
     break
   fi
done

# Increment the index to get the next power profile
index=$(( (index + 1) % ${#profiles[@]} ))

# Set the next power profile
powerprofilesctl set "${profiles[$index]}"

text="${profiles[$index]}"
class="${profiles[$index]}"

echo -e "{\"text\":\""$text"\", \"class\":\""$class"\"}"