# Steam profile (applies to games/apps launched from Steam as well)
private ${HOME}/.local/share/firejails/steam
private-tmp
noblacklist ${HOME}/.steam
noblacklist ${HOME}/.local/share/steam
#include /etc/firejail/disable-mgmt.inc
#include /etc/firejail/disable-secret.inc
#include /etc/firejail/disable-common.inc
#include /etc/firejail/disable-devel.inc
caps.drop all
netfilter
#noroot                 # This crashes a lot of games, although not all.
seccomp
#protocol unix,inet,inet6 # This causes games to not detect my controller 
