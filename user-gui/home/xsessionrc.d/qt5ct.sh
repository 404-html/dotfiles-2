# This makes qt application look great!
# edit: kde5 uses a new systray protocol. Apps using kde5 systray icons will fail 
# since awesomewm does not support it.
# https://bugs.kde.org/show_bug.cgi?id=353062
#export XDG_CURRENT_DESKTOP=kde

# edit: found a solution =D 
# https://bbs.archlinux.org/viewtopic.php?id=206876
#- configure GTK2    (use lxappearance for example)
#- configure GTK3    (use dconf-editor)
#- configure QT4       (use qtconfig-qt4)
#- configure QT5       (use qt5ct)
#- configure KDE5    (use systemsettings5)
if ! [ "$XDG_CURRENT_DESKTOP" = "KDE" ]; then
    if hash qt5ct 2>/dev/null; then
        #export QT_QPA_PLATFORMTHEME="kde"      #  Same as "qt5ct" but now apps know about kde configuration. Can create the systray fail.
        export QT_QPA_PLATFORMTHEME="qt5ct"
        export QT_XFT="true"
        export QT_SELECT="5"
    fi
fi
