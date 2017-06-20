#!/bin/bash

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.sh_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -r ~/.sh_aliases ] && ! [ -f ~/.noaliases ]; then
    . ~/.sh_aliases
fi
