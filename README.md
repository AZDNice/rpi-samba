# samba on docker for Raspberry Pi / armhf


This project builds a Raspberry PI Docker container embedding a Samba server. This container allows you to share files over network using SMB protocol, used by Windows clients.

## Usage
Prefix any config directive of minidlna with MINIDLNA_ and run your container:

sudo docker create --name rpi-samba --restart always -p 445:445 -p 139:139 -p 135:135/udp -p 137:137/udp -p 138:138/udp -p 111:111/udp -p 111:111/tcp -p 2049:2049/tcp -p 2049:2049/udp -v /mnt/mediadisk:/mnt/mediadisk -v /home/pi/rpi-samba:/etc/rpi-samba rpi-samba

sudo docker run --name rpi-samba --network host -p 445:445 -p 139:139 -p 135:135/udp -p 137:137/udp -p 138:138/udp -p 111:111/udp -p 111:111/tcp -p 2049:2049/tcp -p 2049:2049/udp -v /mnt/mediadisk:/mnt/mediadisk -v /home/pi/rpi-samba:/etc/rpi-samba rpi-samba

sudo docker start rpi-samba



