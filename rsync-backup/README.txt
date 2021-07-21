# synology rsync ref
- https://kb.synology.com/ko-kr/DSM/help/DSM/AdminCenter/file_rsync?version=6
- https://www.itkairos.com/222

# 사전작업
시놀로지 나스 제어판 > 사용자 > 고급 > 사용자 홈서비스 활성화
시놀로지 나스 제어판 > 터미널 & SNMP 섹션 SSH를 활성화
시놀로지 나스 제어판 > 파일 서비스 > rsync 탭 rsync를 활성화

# 시놀로지 나스에 SSH 접속 후 ~/위치에 .ssh폴더 생성 (SSH는 시놀로지 admin권한으로만 접속가능)
ssh admin@192.168.100.100
cd ~/
mkdir .ssh

# aws클라우드서버에서 공개키 생성 후 시놀로지 나스로 전송.
ssh root@15.165.143.75
ssh-keygen -t rsa
ssh-copy-id -i ~/.ssh/id_rsa.pub awsbackup@yourid.synology.me

# aws클라우드서버에서 비밀번호 없이 nas로 접속가능한지 확인
ssh awsbackup@yourid.synology.me

# aws클라우드서버에서 시놀로지 nas로 rsync 명령어 동작 테스트 (n옵션으로 실제복사는 하지않고 대상파일만 확인 dry-run)
rsync -avhrn --include="*/" --include="*.jpg" --include="*.npz" --exclude="*" /home/grow/data/ awsbackup@yourid.synology.me:/volume1/AWSBACKUP/

# aws클라우드서버에서 시놀로지 nas로 rsync 명령어 수행 (>>로 로그파일남기고, 끝에 &옵션 붙여서 백그라운드에서 실행. 실시간로그추적은  tail -f test.log 하여 확인가능
rsync -avhr --include="*/" --include="*.jpg" --include="*.npz" --exclude="*" /home/grow/data/ awsbackup@yourid.synology.me:/volume1/AWSBACKUP/ >> test.log &

# aws클라우드서버에서 로그값 저장을 위해 디렉터리 생성
cd /
mkdir /log

# aws클라우드서버에서 시놀로지 nas로 rsync 명령어 수행을 일정주기별로 자동으로 실행하도록 crontab 설정 (매일 새벽2시에 1회 수행하도록 설정)
# crontab 문법 생성기 https://crontab-generator.org/
crontab -e
0 2 * * * rsync -avhr --include="*/" --include="*.jpg" --include="*.npz" --exclude="*" /home/grow/data/ awsbackup@yourid.synology.me:/volume1/AWSBACKUP/ >> /root/log/$(date '+%Y%m%d%H%M')_rsync.log

# aws클라우드서버에서 30일 이전 데이터는 삭제하도록함
