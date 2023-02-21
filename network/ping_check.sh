#!/bin/bash

# 환경설정
export PATH=/usr/local/bin:/usr/local/sbin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin

# 무한 반복문을 수행하며 네트워크 동작유무에 따라 mqtt-io 서비스 중지/실행을 처리함
while true;
do
    # mqtt service check
    ping -c 1 -W 1 8.8.8.8 > /dev/null 2>&1

    # return 값이 0인 경우에는 정상
    if [ $? -eq 0 ]; then
        echo "$(date): Connected" 

    else
        echo "$(date): LGU+ DOWN" 
    fi
    # 다음 재진단은 1초 뒤에 수행
    sleep 1
done
