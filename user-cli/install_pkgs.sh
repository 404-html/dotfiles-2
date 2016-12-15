#!/bin/bash

if [ "$UID" -ne 0 ]; then
    CAN_I_RUN_SUDO=$(sudo -n uptime 2>&1|grep "load"|wc -l)
    if [ $CAN_I_RUN_SUDO -eq 1 ]; then
        sudo "$0"
        exit
    else
        >&2 echo 'Root login:'
        su -c "$0"
        exit 
    fi
fi

if hash apt-get &>/dev/null; then
    hash apt &>/dev/null && tool=apt
    tool=${tool-apt-get}
    pkgs=(neovim htop curl git grc ssvnc 
        xclip xcape x11vnc sudo xcape pdfgrep
        trash-cli dnsutils python3-pyftpdlib inxi
        tmux mpv wine wine-development libsecret-tools
        youtube-dl net-tools ffmpeg silversearcher-ag)

    "$tool" install "${pkgs[@]}"
else
    >&2 echo 'Error: apt-get not in path. Is this a debian based system?'
fi
