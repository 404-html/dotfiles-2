#!/bin/bash

if [[ "$TERM" == rxvt* ]]; then
    #urxvt resize eats output
    #http://lists.schmorp.de/pipermail/rxvt-unicode/2014q4/002058.html
    printf '\e[99999;H\n\e[H'
fi
