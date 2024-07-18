#!/bin/bash

if pgrep -x "screenkey" > /dev/null
then
    pkill screenkey
else
    screenkey
fi

