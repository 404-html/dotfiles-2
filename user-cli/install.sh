#!/bin/bash

cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

find "$HOME" -maxdepth 1 &>/dev/null && echo Searching for broken links
find "$HOME" -maxdepth 1 -xtype l -ok rm '{}' \;
cd home
for f in *;do
    if [ -e "$f" ]; then
        ln -rTsf "$PWD/$f" "$HOME/.$f"
    fi
done
cd - >/dev/null

for d in config local/share ;do
    mkdir -p "$HOME/.$d"
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

mkdir -p $HOME/{.opt,.bin,.local/bin}

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

echo 'Clone zsh-autosuggestions? [y/n]'
read a
if [[ "$a" =~ ^(yes|y|Y)$ ]]; then
    git clone --recursive 'https://github.com/zsh-users/zsh-autosuggestions' "${ZDOTDIR:-$HOME}/.zsh-autosuggestions"
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

