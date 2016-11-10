#!/bin/bash

cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

./user-cli/install.sh
./user-gui/install.sh

