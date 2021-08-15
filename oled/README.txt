**라즈베리파이 및 오렌지파이 SSD1306 OLED 상태창 소스코드**

폰트 다운로드 출처
https://dl.dafont.com/dl/?f=dogica

orangepi zero용

sudo -i
armbian-config

경로 system - hardware
i2c0 스페이스로 선택후 저장하여 활성화
패키지 설치

sudo apt update
sudo apt upgrade -y
sudo apt install i2c-tools -y

sudo reboot
i2cdetect -y 0
이렇게 보여야함

sudo apt install -y python3-dev
sudo apt install -y python3-smbus
sudo apt install -y python3-setuptools
sudo apt install -y python3-pip
sudo apt install -y python3-pil

sudo apt install -y git
sudo git clone https://github.com/adafruit/Adafruit_Python_SSD1306.git

cd Adafruit_Python_SSD1306
sudo python3 setup.py install
sudo pip3 install wheel
sudo pip3 install Adafruit_BBIO

cd /root
wget https://www.tabspace.kr/oled/dogicapixel.ttf
wget https://www.tabspace.kr/oled/ogpi_stats.py

crontab -e
마지막줄에 아래 추가
@reboot python3 /root/ogpi_stats.py &

sudo reboot
재부팅 후 적용 확인
