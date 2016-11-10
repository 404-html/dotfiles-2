#!/bin/bash

if [ $# -ne 1 ] || [ "$1" = '--help' ];then
    echo 'Usage: obshutdown <operation>' >&2
    echo ' Elegantly shutdown the system from an openbox session.' >&2
    echo 'Operations:' >&2
    echo -e '\t''--halt\t\t Halts the system from a openbox session' >&2
    echo -e '\t''--reboot\t Reboots the system from a openbox session' >&2
    exit
fi


case "$1" in
    "--halt" )
        op="poweroff"
        ;;
    "--reboot" )
        op="reboot"
        ;;
    *)
        echo "Operation not recognized." >&2
        exit
        ;;
esac


PID=$(pgrep -xU $USER openbox)
if [ -z "$PID" ];then
    PID=$(pgrep -xU $USER openbox-session)
    if [ -z "$PID" ];then
        echo 'Error: No running openbox process detected.' >&2
        exit 
    fi
fi

openbox --exit
strace -qqe '' -p $PID
eval "$op"
    
