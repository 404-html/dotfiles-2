#!/bin/bash

if [ "$UID" -ne 0 ]; then
    if hash sudo && groups | egrep -q "\<(sudo|wheel)\>"; then
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
        tmux mpv wine wine-development libsecret-tools neofetch
        youtube-dl net-tools ffmpeg silversearcher-ag command-not-found)

    "$tool" install "${pkgs[@]}"
else
    >&2 echo 'Error: apt-get not in path. Is this a debian based system?'
fi
