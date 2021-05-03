# /root/hostname.sh 생성

#!/bin/bash
HOSTNAME=`echo TaS-$(ifconfig eth0|grep ether |awk '{print $2}'|cut -f 4-6 -d':'| tr [:lower:] [:upper:] | sed -e 's/://g')`
hostnamectl set-hostname ${HOSTNAME}

# 이후에 'crontab -e' 하여 마지막줄에
# @reboot /root/hostname.sh
# 를 추가하여준다.
