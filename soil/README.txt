1. 클라우드서버에서 zerotier network join
- root@zerotier:~/log# zerotier-cli join XXXXXX
- 200 join OK

2. 클라우드서버에서 ssh-key값 생성
root@zerotier:~/log# cd /root/.ssh/
root@zerotier:~/.ssh# ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/root/.ssh/id_rsa): 
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /root/.ssh/id_rsa
Your public key has been saved in /root/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:oYbQtkTTFNjeBSPnPNzSp7vmRu4CVvpCtbaJ5MbzR60 root@zerotier
The key's randomart image is:
+---[RSA 3072]----+
|    o=+.+.       |
|   o..o* +.      |
|  . +. .B.o .    |
|   + o..++ o     |
|    o o+S...     |
|     .* o o..    |
|     * = *..     |
|      B = E.     |
|     . +.B+      |
+----[SHA256]-----+

3. 클라우드서버에서 id_rsa.pub값을 라즈베리파이로 복사
root@zerotier:~/.ssh# scp id_rsa.pub 10.11.12.231:/root/.ssh/authorized_keys
root@10.11.12.231's password: 
id_rsa.pub                                                                          100%  567    13.8KB/s   00:00    

4. 클라우드서버에서 ssh명령어를 통해 비밀번호 없이 원격접속되는지 확인
root@zerotier:~/.ssh# ssh 10.11.12.231
Linux Golf-soil-raspi 5.4.77-v7l+ #1371 SMP Tue Nov 17 13:35:27 GMT 2020 armv7l

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Sat Jul 17 18:07:14 2021 from 10.11.12.21
root@Golf-soil-raspi:~# exit
logout
Connection to 10.11.12.231 closed.

5. 클라우드서버에서 크론탭 설정
- crontab -e
- */5 * * * * ssh 10.11.12.231 "/home/pi/pg_start.sh" >> /root/log/log.log 2>&1 추가
