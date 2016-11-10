#!/bin/bash

for f in $(awk -F = '/Path/ {print $2}'  $HOME/.mozilla/firefox/profiles.ini); do
    ln -sr ./user.js "$HOME/.mozilla/firefox/$f"
do
