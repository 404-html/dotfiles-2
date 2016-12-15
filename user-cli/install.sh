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

echo 'Install necessary packages[y/n]'
read a
if [[ "$a" =~ ^(yes|y|Y)$ ]]; then
    ./install_pkgs.sh
fi

echo 'Clone fasd? [y/n]'
read a
if [[ "$a" =~ ^(yes|y|Y)$ ]]; then
    mkdir -p "$HOME/.local/bin"
    curl 'https://raw.githubusercontent.com/clvv/fasd/master/fasd' -o "$HOME/.local/bin/fasd"
    chmod +x "$HOME/.local/bin/fasd"
fi

echo 'Clone zprezto? [y/n]'
read a
if [[ "$a" =~ ^(yes|y|Y)$ ]]; then
    git clone --recursive 'https://github.com/sorin-ionescu/prezto.git' "${ZDOTDIR:-$HOME}/.zprezto"
    ./install_zsh_custom_prompt.sh
fi

echo 'Set zsh as default shell? [y/n]'
read a
if [[ "$a" =~ ^(yes|y|Y)$ ]]; then
    chsh -s "$(which zsh)"
fi

