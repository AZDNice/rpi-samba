# samba on docker for Raspberry Pi / armhf


This project builds a Raspberry PI Docker container embedding a Samba server. This container allows you to share files over network using SMB protocol, used by Windows clients.

## Usage
Prefix any config directive of minidlna with MINIDLNA_ and run your container:

sudo docker create --name rpi-samba --restart always -p 445:445 -p 139:139 -p 137:137/udp -p 138:138/udp -v /mnt/mediadisk:/mnt/mediadisk rpi-samba


sudo docker start rpi-samba



