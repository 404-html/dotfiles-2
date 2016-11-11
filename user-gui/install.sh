#!/bin/bash

cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

cd home
for f in *;do
    if [ -e "$f" ];then
        ln -Tsf "$PWD/$f" "$HOME/.$f"
    fi
done
cd - >/dev/null

for d in config local/share ;do
    cd "$d"
    for f in *;do
        if [ -e "$f" ]; then
            ln -Tsf "$PWD/$f" "$HOME/.$d/$f"
        fi
    done
    cd - >/dev/null
done

