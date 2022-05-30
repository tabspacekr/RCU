# /root/hostname_full_mac_address.sh 생성

#!/bin/bash
HOSTNAME=`echo NK$(ifconfig eth0|grep ether |awk '{print $2}'|cut -f 1-6 -d':'| tr [:lower:] [:upper:] | sed -e 's/://g')`
hostnamectl set-hostname ${HOSTNAME}

# 이후에 'crontab -e' 하여 마지막줄에
# @reboot su - root -c /root/hostname_full_mac_address.sh
# 를 추가하여준다. (su - root -c 가 없을 시에, 재부팅시에 맥어드레스 추출에 실패하며, NK 만 표기됨)
