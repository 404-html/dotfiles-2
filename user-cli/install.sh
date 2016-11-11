#!/bin/bash

cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

cd home
for f in *;do
    if [ -e "$f" ]; then
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

echo 'Should I install zprezto? [y/n]'
read a
if [[ "$a" =~ ^(yes|y|Y)$ ]]; then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi
