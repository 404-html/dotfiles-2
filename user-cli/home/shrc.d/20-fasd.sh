#!/bin/bash

# fasd init
# https://github.com/clvv/fasd
if hash fasd 2>/dev/null; then
    eval "$(fasd --init auto)"
fi
