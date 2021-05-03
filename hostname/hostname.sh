# /root/hostname.sh 생성

#!/bin/bash
HOSTNAME=`echo TaS-$(ifconfig eth0|grep ether |awk '{print $2}'|cut -f 4-6 -d':'| tr [:lower:] [:upper:] | sed -e 's/://g')`
hostnamectl set-hostname ${HOSTNAME}

# 이후에 'crontab -e' 하여 마지막줄에
# @reboot su - root -c /root/hostname.sh
# 를 추가하여준다. (su - root -c 가 없을 시에, 재부팅시에 맥어드레드 뒷 6자리 추출에 실패하며, TaS 만 표기됨)
