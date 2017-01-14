#!/bin/bash

adb root
adb remount
adb shell chmod 000 -R /system/app/Stk
adb shell chmod 000 -R /system/media/audio/ui/camera_click.ogg
adb shell chmod 000 -R /system/media/audio/ui/camera_focus.ogg

echo 'Done. Modification will apply after next reboot.'
