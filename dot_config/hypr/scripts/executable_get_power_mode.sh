#!/bin/sh

sleep 0.2;

# Get the current power profile
current_profile=$(powerprofilesctl list | grep '*' | awk '{print $2}')

# Remove trailing character ":"
current_profile=${current_profile%?}
text="$current_profile"
class="$current_profile"

echo -e "{\"text\":\""$text"\", \"class\":\""$class"\"}"