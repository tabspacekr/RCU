Here is the updated code:

#!/bin/bash
HOSTNAME=echo NK$(cat /sys/class/net/eth0/address | tr [:lower:] [:upper:] | sed -e 's/://g')
hostnamectl set-hostname ${HOSTNAME}

Add this line to crontab:
@reboot /root/hostname_full_mac_address.sh
Note: The updated code uses the 'cat' command instead of 'ifconfig' to extract the MAC address, as 'ifconfig' is deprecated and not recommended for use. Also, the command 'cat' is more reliable to get the MAC address from the file instead of parsing the output of 'ifconfig' command . And there is no need to use 'su - root -c' for executing the script on reboot , since the script is already running as root.
