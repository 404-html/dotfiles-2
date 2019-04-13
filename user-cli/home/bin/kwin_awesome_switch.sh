#!/bin/bash

if pgrep -xU $USER kwin_x11; then
    pkill -x -U $USER kwin_x11 
    sleep 1 
    awesome --replace &
    compton -b
elif pgrep -xU $USER awesome; then
    pkill -x -U $USER awesome 
    sleep 1 
    kwin_x11 --replace &
fi

