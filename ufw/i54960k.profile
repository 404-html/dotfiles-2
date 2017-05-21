[fwBasic]
status = enabled
incoming = deny
outgoing = allow
routed = disabled

[Rule0]
ufw_rule = 1716 ALLOW IN Anywhere
description = kdeconnect
command = /usr/sbin/ufw allow in from any to any port 1716
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 1716
iface = 
routed = 
logging = 

[Rule1]
ufw_rule = 21027/udp ALLOW IN Anywhere
description = syncthing-discovery
command = /usr/sbin/ufw allow in proto udp from any to any port 21027
policy = allow
direction = in
protocol = udp
from_ip = 
from_port = 
to_ip = 
to_port = 21027
iface = 
routed = 
logging = 

[Rule2]
ufw_rule = 445/tcp on virbr1 ALLOW IN Anywhere
description = samba-kvm
command = /usr/sbin/ufw allow in on virbr1 proto tcp from any to any port 445
policy = allow
direction = in
protocol = tcp
from_ip = 
from_port = 
to_ip = 
to_port = 445
iface = virbr1
routed = 
logging = 

[Rule3]
ufw_rule = 49151 ALLOW IN Anywhere
description = torrent
command = /usr/sbin/ufw allow in from any to any port 49151
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 49151
iface = 
routed = 
logging = 

[Rule4]
ufw_rule = 5353/udp ALLOW IN Anywhere
description = avahi
command = /usr/sbin/ufw allow in proto udp from any to any port 5353
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 5353/udp
iface = 
routed = 
logging = 

[Rule5]
ufw_rule = 22/tcp on eth1 ALLOW IN 192.168.1.0/24
description = ssh-local
command = /usr/sbin/ufw allow in on eth1 proto tcp from 192.168.1.0/24 to any port 22
policy = allow
direction = in
protocol = tcp
from_ip = 192.168.1.0/24
from_port = 
to_ip = 
to_port = 22
iface = eth1
routed = 
logging = 

[Rule6]
ufw_rule = 22000/tcp on eth1 ALLOW IN 192.168.1.0/24
description = syncthing-local
command = /usr/sbin/ufw allow in on eth1 proto tcp from 192.168.1.0/24 to any port 22000
policy = allow
direction = in
protocol = tcp
from_ip = 192.168.1.0/24
from_port = 
to_ip = 
to_port = 22000
iface = eth1
routed = 
logging = 

[Rule7]
ufw_rule = 1716 (v6) ALLOW IN Anywhere (v6)
description = kdeconnect
command = /usr/sbin/ufw allow in from any to any port 1716
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 1716
iface = 
routed = 
logging = 

[Rule8]
ufw_rule = 21027/udp (v6) ALLOW IN Anywhere (v6)
description = syncthing-discovery
command = /usr/sbin/ufw allow in proto udp from any to any port 21027
policy = allow
direction = in
protocol = udp
from_ip = 
from_port = 
to_ip = 
to_port = 21027
iface = 
routed = 
logging = 

[Rule9]
ufw_rule = 445/tcp (v6) on virbr1 ALLOW IN Anywhere (v6)
description = samba-kvm
command = /usr/sbin/ufw allow in on virbr1 proto tcp from any to any port 445
policy = allow
direction = in
protocol = tcp
from_ip = 
from_port = 
to_ip = 
to_port = 445
iface = virbr1
routed = 
logging = 

[Rule10]
ufw_rule = 49151 (v6) ALLOW IN Anywhere (v6)
description = torrent
command = /usr/sbin/ufw allow in from any to any port 49151
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 49151
iface = 
routed = 
logging = 

[Rule11]
ufw_rule = 5353/udp (v6) ALLOW IN Anywhere (v6)
description = avahi
command = /usr/sbin/ufw allow in proto udp from any to any port 5353
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 5353/udp
iface = 
routed = 
logging = 

[Rule12]
ufw_rule = 22/tcp on eth1 ALLOW IN fe80::/64
description = ssh-local
command = /usr/sbin/ufw allow in on eth1 proto tcp from fe80::/64 to any port 22
policy = allow
direction = in
protocol = tcp
from_ip = fe80::/64
from_port = 
to_ip = 
to_port = 22
iface = eth1
routed = 
logging = 

[Rule13]
ufw_rule = 22000/tcp on eth1 ALLOW IN fe80::/64
description = syncthing-local
command = /usr/sbin/ufw allow in on eth1 proto tcp from fe80::/64 to any port 22000
policy = allow
direction = in
protocol = tcp
from_ip = fe80::/64
from_port = 
to_ip = 
to_port = 22000
iface = eth1
routed = 
logging = 

