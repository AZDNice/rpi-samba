# minidnla in docker for Raspberry Pi / armhf


This is minidlna on top of arm64v8/debian-slim. It can be configured with environment variables.

## Usage
Prefix any config directive of minidlna with MINIDLNA_ and run your container:

sudo docker create --name rpi-minidlna --restart always --net=host -p 8200:8200 -p 1900:1900/udp -v /mnt/mediadisk:/mnt/mediadisk rpi-minidlna

sudo docker start rpi-minidlna

See: http://manpages.ubuntu.com/manpages/raring/man5/minidlna.conf.5.html

