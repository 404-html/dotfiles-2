#!/bin/bash

if ! [[ "$TERM" == rxvt* ]] && ! [[ "$TERM" == xterm* ]];then
    [ -r "$HOME/.sh_theme" ] && source $HOME/.sh_theme
fi
