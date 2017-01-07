#!/bin/bash

cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

find "$HOME" -maxdepth 1 &>/dev/null && echo Searching for broken links
find "$HOME" -maxdepth 1 -xtype l -ok rm '{}' \;
cd home
for f in *;do
    if [ -e "$f" ];then
        ln -rTsf "$PWD/$f" "$HOME/.$f"
    fi
done
cd - >/dev/null

for d in config local/share ;do
    find "$HOME/.$d" -maxdepth 1 &>/dev/null && echo Searching for broken links
    find "$HOME/.$d" -maxdepth 1 -xtype l -ok rm '{}' \;
    cd "$d"
    for f in *;do
        if [ -e "$f" ]; then
            ln -rTsf "$PWD/$f" "$HOME/.$d/$f"
        fi
    done
    cd - >/dev/null
done

