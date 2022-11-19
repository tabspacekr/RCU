#!/bin/bash
# crontab -e
# @reboot /root/radio_network_check.sh

# 환경설정
export PATH=/usr/local/bin:/usr/local/sbin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin

# ip server
serverAdr="somedomain.tabspace.kr" 

# vlc telnet 서비스 체크
export pid='ps -ef |grep -v grep |grep "vlc -I telnet --telnet-password SECRETPASSWORD"| wc -l'

# pid값이 1인 경우에는 서비스가 정상실행 상태

# 프로세스 정상 실행중인 경우
if [ "$pid" == 1 ]; then
  echo $(date)
  echo "vlc telnet 서비스 정상 실행 중" 
# 프로세스가 실행되지 않았을 경우
else
  echo $(date)
  # vlc telnet서비스 실행
  nohup /usr/bin/vlc -I telnet --telnet-password SECRETPASSWORD > /dev/null 2>&1 &
fi

# 최초 실행 시 네트워크 상태 활성화까지 1초단위로 체크하며 대기
ping -c 1 $serverAdr > /dev/null 2>&1
while [ $? -ne 0 ]; do
  echo "$(date): Try Connecting... - ${serverAdr}"
  sleep 1
  ping -c 1 $serverAdr > /dev/null 2>&1
done

# 네트워크 활성화 되었으므로 라디오 서비스 실행
python3 /root/radio.py &

# 무한 반복문을 수행하며 네트워크 동작유무에 따라 라디오 서비스 중지/실행을 처리함
while true;
do
  # 네트워크 비활성화 유무 체크
  # ping에 대한 결과 값이 0일 경우 비정상, 그 외의 경우 정상
  ping -c 1 $serverAdr > /dev/null 2>&1
  
  if [[ $? -ne 0 ]]; then
    # 네트워크가 비정상이므로 라디오 서비스를 종료함
    echo "$(date): DisConnected - ${serverAdr}"
    python3 /root/radio_stop.py &
  else
    # 네트워크 활성화 되었으므로 라디오 서비스 시작
    echo "$(date): Connected - ${serverAdr}"
    python3 /root/radio_check.py &
  fi
    # 다음 재진단은 10초 뒤에 수행
    sleep 10
done
