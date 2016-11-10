#!/bin/bash

vgadualdesktop(){
    xrandr \
        --output VGA-0 --pos 1280x0 --auto \
        --output LVDS --primary --mode 1280x800 --pos 0x0 \
        --output DIN --off \
        --output HDMI-0 --off
}

vgamirrored(){
    xrandr \
        --output VGA-0 --pos 0x0 --auto \
        --output LVDS --primary --mode 1280x800 --pos 0x0 \
        --output DIN --off \
        --output HDMI-0 --off
}

if [ $# -eq 0 ] || [ "$1" = "--dual" ]; then
    vgadualdesktop
elif [ "$1" = "--mirror" ];then
    vgamirrored
else 
    echo 'Usage:' >&2
    echo -e '\tdual-monitor.sh [--mirror] [--dual]' >&2
fi

