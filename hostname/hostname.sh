# /root/hostname.sh 생성

#!/bin/bash
HOSTNAME=`echo TaS-$(ifconfig eth0|grep ether |awk '{print $2}'|cut -f 4-6 -d':'| tr [:lower:] [:upper:] | sed -e 's/://g')`
hostnamectl set-hostname ${HOSTNAME}

# 이후에 'crontab -e' 하여 마지막줄에
# @reboot sleep 15 && /root/hostname.sh
# 를 추가하여준다. (재부팅시에 TaS만 표기되는 이슈가 있어 sleep 15초 추가)
