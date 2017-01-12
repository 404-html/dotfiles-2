
if [ "$UID" -eq 0 ];then
    # file  rwxr--r--
    # dir   rwxr-xr-x
    umask 022   
else
    # file  rwxr-----
    # dir   rwxr-x---
    umask 027

    # file  rwxr-----
    # dir   rwxr-x--x
    #umask 026
fi
