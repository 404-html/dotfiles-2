#!/bin/bash

wmctrl -ia $( { xdotool search --desktop $(xdotool get_desktop) --name . ; xdotool search --desktop $(xdotool get_desktop) --onlyvisible --name . ; } | sort | uniq -u | head -n1 )

