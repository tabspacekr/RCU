sudo -i

apt update && apt upgrade -y

apt autoremove -y

apt-get install -y software-properties-common apparmor-utils apt-transport-https ca-certificates curl dbus jq network-manager

systemctl disable ModemManager

systemctl stop ModemManager

curl -fsSL get.docker.com | sh

curl -sL "https://raw.githubusercontent.com/Kanga-Who/home-assistant/master/supervised-installer.sh" | bash -s -- -m raspberrypi4-64

[info] 
[info] This script is taken from the official
[info] 
[info] Home Assistant Supervised script available at
[info] 
[info] https://github.com/home-assistant/supervised-installer
[info] 
[info] Creating default docker daemon configuration /etc/docker/daemon.json
[info] Restarting docker service
[info] Creating NetworkManager configuration
[warn] Changes are needed to the /etc/network/interfaces file
[info] If you have modified the network on the host manualy, those can now be overwritten
[info] If you do not overwrite this now you need to manually adjust it later
[info] Do you want to proceed with overwriting the /etc/network/interfaces file? [N/y] 
y
[info] Replacing /etc/network/interfaces
[info] Restarting NetworkManager
