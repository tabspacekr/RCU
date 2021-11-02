## 스왑메모리는 가상메모리 개념으로, 물리적인 메모리에 추가하여 하드디스크에 있는 용량을 메모리처럼 사용하는 기술
## 단점 : 느림 (메모리의 속도와 하드디스크의 속도차이가 많이 나기 때문)
## ref : https://psychoria.tistory.com/717


#스왑메모리 확인
free -m
              total        used        free      shared  buff/cache   available
Mem:           3889        1350         653          40        1885        2236
Swap:             0           0           0

#스왑파일 8G생성
sudo fallocate -l 8G /swapfile

#스왑파일 생성 확인
-rw-r--r--   1 root root 8589934592 Nov  2 20:01 swapfile


#스왑파일 권한 수정
sudo chmod 600 /swapfile

#스왑모드 on
sudo mkswap /swapfile
root@ip-172-31-55-242:/# sudo mkswap /swapfile
Setting up swapspace version 1, size = 8 GiB (8589930496 bytes)
no label, UUID=ffea2cc6-2285-4c09-ba75-8e96383b0e42

sudo swapon /swapfile

#스왑 확인
free -m
              total        used        free      shared  buff/cache   available
Mem:           3889        1353         647          40        1888        2233
Swap:          8191           0        8191

#부팅시 자동실행되도록 처리
sudo nano /etc/fstab

# /etc/fstab: static file system information
UUID=5db68868-2d70-449f-8b1d-f3c769ec01c7 / ext4 rw,discard,errors=remount-ro,x-systemd.growfs 0 1
UUID=72C9-F191 /boot/efi vfat defaults 0 0
/swapfile swap swap defaults 0 0




