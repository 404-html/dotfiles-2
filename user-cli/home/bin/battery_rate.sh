#!/bin/bash

bat0=false
bat1=false

if [ "$#" -eq 1 ];then
    if [ "$1" -eq 0 ];then
        bat0=true
    elif [ "$1" -eq 1 ];then
        bat1=true
    else
        >&2 echo "Usage $0 [battery_number]"
    fi
else
    bat0=true
fi

if $bat0;then 
    status=$(cat /sys/class/power_supply/BAT0/status)
    if [ "$status" = "Charging"  ]; then
        echo -n + 
    elif [ "$status" = "Discharging"  ]; then
        echo -n -
    fi
    awk '{print $1*10^-6}' /sys/class/power_supply/BAT0/power_now
fi

if $bat1;then 
    if [ -e /sys/class/power_supply/BAT1 ];then
        status=$(cat /sys/class/power_supply/BAT1/status)
        if [ "$status" = "Charging"  ]; then
            echo -n + 
        elif [ "$status" = "Discharging"  ]; then
            echo -n -
        fi
        awk '{print $1*10^-6}' /sys/class/power_supply/BAT1/power_now
    else
        echo 'N/A'
    fi
fi

