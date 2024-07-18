#!/bin/bash

# Get the timer duration from the user
duration=$(zenity --entry --title="Countdown Timer" --text="How many minutes?" --width=100 --height=150)

# Check if the user canceled the input dialog or entered an invalid number
if [[ -z "$duration" || ! "$duration" =~ ^[0-9]+$ ]]; then
    zenity --error --text="Please enter a valid number." --width=100 --height=150
    exit 1
fi

# Convert minutes to seconds
duration=$((duration * 60))

# Start the countdown in the background
(
    for ((i=$duration; i>0; i--)); do
        duration_minutes=$((i / 60))
        echo "Time remaining: $duration_minutes min"
        echo "$((100 - (i * 100 / duration)))"
        sleep 1
    done
) | zenity --progress --title="Countdown Timer" --text="Time remaining: $duration seconds" --percentage=0 --auto-close & --width=100 --height =150

# Wait a moment to allow the Zenity window to appear
sleep 1

# Get the PID of the Zenity progress dialog
zenity_pid=$!

# Get the Zenity progress dialog's window ID and set it to stay on top and be visible on all workspaces
wmctrl -r "Countdown Timer" -b add,above
wmctrl -r "Countdown Timer" -b add,sticky

# Wait for the progress dialog to finish
wait $zenity_pid

# Check the exit status of Zenity
zenity_exit_status=$?

# If the user canceled the timer, exit gracefully
if [[ $zenity_exit_status -ne 0 ]]; then
    exit 1
fi

# Play the alarm sound
paplay /usr/share/sounds/timer/alarm.mp3
