#!/bin/bash

# 환경설정
export PATH=/usr/local/bin:/usr/local/sbin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin

# 무한 반복문을 수행하며 네트워크 동작유무에 따라 mqtt-io 서비스 중지/실행을 처리함
while true;
do
  # mqtt service check
  #export mqtt='timeout 1 bash -c "cat < /dev/null > /dev/tcp/localhost/1883"'
  timeout 1 bash -c "cat < /dev/null > /dev/tcp/localhost/1883"

  # return 값이 0인 경우에는 mqtt 서비스가 정상실행 상태  
  if [ "$?" == 0 ]; then
    # mqtt 서비스 정상 실행 출력
    echo "$(date): MQTT Connected"

    # mqtt-io 프로세스가 존재하는지 확인
    pid=`ps -ef |grep -v grep |grep 'python3 -m mqtt_io /root/config.yml'| wc -l`

    # 만약 mqtt-io 프로세스가 존재한다면 pid가 1로 반환될것임
    #if [ "$?" == "1" ]; then
    if [ $pid == 1 ]; then
      echo "$(date): mqtt-io 서비스 정상 실행 중" 

    # mqtt-io 프로세스가 없는 경우 재시작 처리함
    else
      # 백그라운드로 프로세스 시작, nohup.out 안남기기 위해 /dev/null로 날림
      echo "$(date): mqtt-io 서비스 재시작" 
      pkill -9 -f "python3 -m mqtt_io /root/config.yml" 
      nohup python3 -m mqtt_io /root/config.yml > /dev/null 2>&1 &
    fi

  else
    # 네트워크 비정상이므로 mqtt-io 서비스 중지
    echo "$(date): MQTT DisConnected"
    pkill -9 -f "python3 -m mqtt_io /root/config.yml" 
  fi
    # 다음 재진단은 10초 뒤에 수행
    sleep 10
done
