#!/bin/bash

if ! [ -e ~/.hushlogin ];then
    [ -r ~/.sh_motd ] && cat ~/.sh_motd
    hash fortune 2>/dev/null && echo '  '$(fortune -s)
fi

