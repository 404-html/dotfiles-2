#!/bin/bash

# if interactive shell and tmux is installed
if [[ $- == *i* ]] && hash tmux 2>/dev/null; then
    # Autostart tmux if ssh connecton.
    if [ -z "$TMUX" ] && [ "$SSH_CONNECTION" ];then
        if tmux has-session -t "ssh" &>/dev/null;then
            exec tmux attach -t "ssh"
        else
            exec tmux new -s "ssh"
        fi
    fi
fi
