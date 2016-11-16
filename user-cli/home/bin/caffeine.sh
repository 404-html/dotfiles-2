#!/bin/bash

trap closedoor SIGHUP SIGINT SIGTERM

function closedoor {
    if [ "$XDG_CURRENT_DESKTOP" = 'KDE' ]; then
        qdbus org.freedesktop.PowerManagement /org/freedesktop/PowerManagement/Inhibit UnInhibit "$id"
    fi

}

if [ "$XDG_CURRENT_DESKTOP" = 'KDE' ]; then
    id=$(qdbus org.freedesktop.PowerManagement /org/freedesktop/PowerManagement/Inhibit Inhibit 'Caffeine' 'User requested.')
    sleep infinity

elif &>/dev/null pgrep -x xscreensaver ; then
    while true; do
        xscreensaver-command -deactivate > /dev/null 
        sleep 30s 
    done
fi

closedoor
