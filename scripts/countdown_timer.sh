#!/bin/bash

# Get the timer duration from the user
duration=$(zenity --entry --title="Countdown Timer" --text="Enter the countdown duration in seconds:")

# Check if the user entered a valid number
if ! [[ "$duration" =~ ^[0-9]+$ ]]; then
    zenity --error --text="Please enter a valid number."
    exit 1
fi

# Start the countdown
(
    for ((i=$duration; i>0; i--)); do
        echo "# Time remaining: $i seconds"
        echo "$((100 - (i * 100 / duration)))"
        sleep 1
    done
) | zenity --progress --title="Countdown Timer" --text="Time remaining: $duration seconds" --percentage=0 --auto-close

# Play the alarm sound
paplay /usr/share/sounds/timer/alarm.mp3

# Notify the user that the time is up
zenity --info --text="Time's up!"
