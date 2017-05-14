[fwBasic]
status = enabled
incoming = reject
outgoing = allow
routed = disabled

[Rule0]
ufw_rule = 22/tcp ALLOW IN Anywhere
description = SSH
command = /usr/sbin/ufw allow in proto tcp from any to any port 22
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 22/tcp
iface = 
routed = 
logging = 

[Rule1]
ufw_rule = 1716 ALLOW IN Anywhere
description = kdeconnectd
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

[Rule2]
ufw_rule = 22000/tcp ALLOW IN Anywhere
description = Syncthing
command = /usr/sbin/ufw allow in proto tcp from any to any port 22000
policy = allow
direction = in
protocol = tcp
from_ip = 
from_port = 
to_ip = 
to_port = 22000
iface = 
routed = 
logging = 

[Rule3]
ufw_rule = 21027/udp ALLOW IN Anywhere
description = Syncthing Discovery
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

[Rule4]
ufw_rule = 5353/udp ALLOW IN Anywhere
description = avahi
command = /usr/sbin/ufw allow in proto udp from any to any port 5353
policy = allow
direction = in
protocol = udp
from_ip = 
from_port = 
to_ip = 
to_port = 5353
iface = 
routed = 
logging = 

[Rule5]
ufw_rule = 22/tcp (v6) ALLOW IN Anywhere (v6)
description = SSH
command = /usr/sbin/ufw allow in proto tcp from any to any port 22
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 22/tcp
iface = 
routed = 
logging = 

[Rule6]
ufw_rule = 1716 (v6) ALLOW IN Anywhere (v6)
description = kdeconnectd
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

[Rule7]
ufw_rule = 22000/tcp (v6) ALLOW IN Anywhere (v6)
description = Syncthing
command = /usr/sbin/ufw allow in proto tcp from any to any port 22000
policy = allow
direction = in
protocol = tcp
from_ip = 
from_port = 
to_ip = 
to_port = 22000
iface = 
routed = 
logging = 

[Rule8]
ufw_rule = 21027/udp (v6) ALLOW IN Anywhere (v6)
description = Syncthing Discovery
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
ufw_rule = 5353/udp (v6) ALLOW IN Anywhere (v6)
description = avahi
command = /usr/sbin/ufw allow in proto udp from any to any port 5353
policy = allow
direction = in
protocol = udp
from_ip = 
from_port = 
to_ip = 
to_port = 5353
iface = 
routed = 
logging = 

