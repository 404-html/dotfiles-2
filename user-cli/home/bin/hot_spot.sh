#!/bin/bash

#Use:
#nat in_interface out_interface
nat(){

echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -F
iptables -t nat -F
iptables -t mangle -F

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -i wlan0 -j ACCEPT

# iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j DNAT --to 192.168.1.2:8080
# iptables -A FORWARD -p tcp -d 192.168.1.2 --dport 8080 -j ACCEPT

return
}


ad_hoc(){

#service network-manager stop &

ifconfig wlan0 down
iwconfig wlan0 mode ad-hoc
iwconfig wlan0 channel 6
iwconfig wlan0 essid 'ad-hoc'
iwconfig wlan0 key '1234567890'
ifconfig wlan0 up

ifconfig wlan0 192.168.23.1 netmask 255.255.255.0

return
}

restore(){

iwconfig wlan0 mode managed
echo 0 > /proc/sys/net/ipv4/ip_forward
#service network-manager start

return
}

# --- MAIN ---

tty -s 
if [ $? -ne 0 ]
then
	exec xfce4-terminal -e "$0 $@"
fi

if [[ $UID != 0 ]]
then

#	sudo -n uptime &> /dev/null
#	if ! [[ $? ]]
#	then
#		echo -ne 'password''\n' | sudo -S $0 $@
#	else
#		sudo $0 $@
#	fi
	
	sudo $0 $@
	exit $?

fi

clear
echo -e "\nOptions:"
echo -e "\t1 - ad-hoc up"
echo -e "\t2 - NAT"
echo -e "\t3 - Restore network"
echo -e "\t4 - DHCP server"

alive=true
while $alive
do

	echo -n "-=>>"

	read opt
	case $opt in

	1)
		ad_hoc;;
	2)
		nat;;
	3)
		restore;;
	4)
		start isc-dhcp-server;;
	*)
		alive=false;;
	esac

done

exit 0
