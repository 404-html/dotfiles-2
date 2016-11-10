#!/bin/bash

cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

cd home
for f in *;do
    ln -Tsf "$PWD/$f" "$HOME/.$f"
done
cd - >/dev/null

for d in config local/share ;do
    cd "$d"
    for f in *;do
        ln -Tsf "$PWD/$f" "$HOME/.$d/$f"
    done
    cd - >/dev/null
done

