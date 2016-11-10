#!/bin/bash

function closedoor {

}

xdg-screensaver reset
qdbus org.freedesktop.PowerManagement /org/freedesktop/PowerManagement/Inhibit Inhibit $app $reason
qdbus org.freedesktop.PowerManagement /org/freedesktop/PowerManagement/Inhibit UnInhibit $id

trap closedoor SIGHUP SIGINT SIGTERM

while true; do
    xscreensaver-command -deactivate > /dev/null 
    sleep 30s 
done

closedoor
