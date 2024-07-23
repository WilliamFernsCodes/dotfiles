#!/bin/bash

# Get the timer duration from the user
duration=$(zenity --entry --title="Countdown Timer" --text="How many minutes?" --width=100 --height=150)

# Check if the user canceled the input dialog or entered an invalid number
if [[ -z "$duration" || ! "$duration" =~ ^[0-9]+$ ]]; then
    zenity --error --text="Please enter a valid number." --width=100 --height=150
    exit 1
fi

# Convert minutes to seconds
duration_seconds=$((duration * 60))
# Ensure duration_minutes is at least 1
duration_minutes=$((duration_seconds / 60))
if [[ $duration_minutes -eq 0 ]]; then
    duration_minutes=1
fi

# Start the countdown in the background
(
    for ((i=duration_seconds; i>0; i--)); do
        minutes_remaining=$((i / 60))
        if [[ $minutes_remaining -eq 0 ]]; then
            minutes_remaining=1
        fi
        echo "# Time remaining: $minutes_remaining min"
        echo "$((100 - (i * 100 / duration_seconds)))"
        sleep 1
    done
) | zenity --progress --title="Countdown Timer" --text="Time remaining: $duration_minutes min" --percentage=0 --auto-close &

# Wait a moment to allow the Zenity window to appear
sleep 0.3

# Get the PID of the Zenity progress dialog
zenity_pid=$!

# Wait for the progress dialog to finish initializing
sleep 0.3

# Get the Zenity progress dialog's window ID
zenity_window_id=$(wmctrl -l | grep "Countdown Timer" | awk '{print $1}')

# Calculate screen dimensions
screen_width=$(xdpyinfo | grep dimensions | awk '{print $2}' | cut -d 'x' -f 1)
screen_height=$(xdpyinfo | grep dimensions | awk '{print $2}' | cut -d 'x' -f 2)

# Calculate position with a small margin from the right and a margin from the top
margin_right=25
margin_top=20
zenity_width=300
zenity_height=100
position_x=$((screen_width - zenity_width - margin_right))
position_y=$margin_top

# Move the Zenity dialog to the calculated position
wmctrl -i -r "$zenity_window_id" -e 0,$position_x,$position_y,-1,-1

# Set Zenity dialog to stay on top and visible on all workspaces
wmctrl -i -r "$zenity_window_id" -b add,above
wmctrl -i -r "$zenity_window_id" -b add,sticky

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

