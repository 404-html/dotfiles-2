#!/bin/bash

adb root
adb remount
echo chmod 000 -R /system/app/Stk | adb shell
echo chmod 000 -R /system/media/audio/notifications/camera_click.ogg | adb shell
echo chmod 000 -R /system/media/audio/notifications/camera_focus.ogg | adb shell

echo 'Done. Modification will apply after next reboot.'
