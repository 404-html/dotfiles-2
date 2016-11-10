#!/bin/bash 

cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

for f in *"$(hostname)"*; do
    ln -fsr "$f"  $HOME/."${f/_$(hostname)/}"
done
