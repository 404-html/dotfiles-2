#!/bin/bash

for f in $(awk -F = '/Path/ {print $2}'  $HOME/.mozilla/firefox/profiles.ini); do
    ln -fsr ./user.js "$HOME/.mozilla/firefox/$f"
done
