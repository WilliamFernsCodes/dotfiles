#!/bin/bash

# Function to check if any Zenity process is running and toggle the timer accordingly
toggle_timer() {
    # Check if there is any Zenity process running
    if pgrep -x "zenity" > /dev/null; then
        echo "Stopping existing Zenity process..."
        pkill -x "zenity"
        echo "Timer stopped."
    else
        echo "Starting countdown timer..."
        countdown_timer.sh
    fi
}

# Call the function to toggle the timer
toggle_timer

