#!/bin/bash

# Enable wakeup for all USB devices
for device in /sys/bus/usb/devices/*/power/wakeup; do
    echo "enabled" | sudo tee $device
done

