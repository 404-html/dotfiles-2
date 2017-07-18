#!/bin/bash

# Mute the anoying speaker beep
xset -b

# Numlock on
numlockx

# Keyboard layout
setxkbmap -layout us -variant altgr-intl 

if [ -r ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

# Remap menu key to actual right click mouse button.
# This requires scroll lock mouse keys, so you loose your numpad.
if [ "$(hostname)" = "a300" ];then
    ~/.bin/rclick
fi

# caps is both escape and ctrl
#if hash xcape 2>/dev/null; then
#    xcape -e 'Control_R=Escape'
#fi

