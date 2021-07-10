sudo nano /root/power_on.py
#======= power_on.py code start ======
import pymysql

grow_db = pymysql.connect(
    user='root',
    passwd='passwordhere',
    host='123.123.123.123',
    db='dbnamehere',
    charset='utf8'
)
cursor = grow_db.cursor(pymysql.cursors.DictCursor)
sql = "INSERT INTO TRACK_LOG(DEVICE_NAME,DEVICE_STATUS) VALUES('T-E-S-T','POWER_ON'); "
cursor.execute(sql)
grow_db.commit()
#======= power_on.py code end ======

sudo nano /lib/systemd/system/power_on.service
#======= power_on.service code start ======
[Unit]
Description=Power ON DB Insert
After=network.target

[Service]
User=root
ExecStart=/usr/bin/python3 /root/power_on.py
Restart=on-failure

[Install]
WantedBy=multi-user.target
#======= power_on.service code end ======

sudo systemctl status power_on.service

sudo systemctl enable power_on.service

sudo systemctl start power_on.service

#이후 라즈베리파이 재부팅( reboot )하여 db insert 상황 확인

#참고 및 주의: /etc/rc.local이 실행가능한 권한이 있어야 함. (sudo chmod a+x /etc/rc.local )
