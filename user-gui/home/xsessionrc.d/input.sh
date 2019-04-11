#!/bin/bash

# Mute the anoying speaker beep
xset -b

# Numlock on
numlockx on

# Keyboard layout
if [ "$(hostname)" = 't560' ] || [ "$(hostname)" = "a300" ] || [ "$(hostname)" = "i5-4690k" ] || [ "$(hostname)" = "FDC-PEDROGAMEIRO-P52" ]; then
    setxkbmap -layout us -variant altgr-intl 
fi

if [ -r ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

if [ "$(hostname)" = 't560' ]; then
    xmodmap -e 'keycode 107=Menu'  # remap printSc to Menu
    xmodmap -e 'keycode 118=Print' # Remap insert to printSc
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

