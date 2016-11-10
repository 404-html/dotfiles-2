#!/bin/bash

dev='SOAI Gaming Mouse.*pointer'
devid=$(xinput list  | grep "$dev" | sed -e 's/.*id=\([0-9]*\).*/\1/')
state=$(xinput list-props "$devid" | grep "Device Enabled" | sed 's/.*\(.\)$/\1/')
not_state=$[ ! $state ]
xinput set-prop $devid "Device Enabled" $not_state

