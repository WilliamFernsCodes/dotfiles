#!/bin/bash

# Path to your i3 config file
CONFIG_FILE=~/.config/i3/config

# Extract keybindings from the config file and remove the 'bindsym' keyword
grep "^bindsym" $CONFIG_FILE | sed 's/^bindsym //' > /tmp/keybindings.txt

# Display keybindings using rofi
rofi -dmenu -i -l 20 -p "i3 Keybindings" < /tmp/keybindings.txt
