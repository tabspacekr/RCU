# MAC Address를 통한 Hostname 자동변경

부팅시마다 eth0 (유선랜) MAC Address의 뒷 6자리를 참고하여 사전지정문자(prefix, 소스에서는 `TaS-` 로 표시)와 함께 고유한 hostname을 부여해줌


# Installation

1. root로 로그인 (sudo -i)

2. cd /root

3. wget https://raw.githubusercontent.com/tabspacekr/RCU/main/hostname/hostname.sh

4. chmod a+x hostname.sh

5. crontab -e

6. (마지막줄에) @reboot su - root -c /root/hostname.sh (추가)

7. reboot

# 유의사항

1. 재부팅을 이후에 Hostname 변경이 적용되므로, 재부팅 요망

2. crontab에서 @reboot su - root -c 를 하지 않을 경우, mac주소를 정상적으로 호출해오지 못함
