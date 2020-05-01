# SMB and NFS server on docker for Raspberry Pi

This project builds a Raspberry PI Docker container embedding a SAMBA(SMB) and NFS. This container allows you to share files over network using SMB and/or NFSprotocol. This is for home usage typically in combination with a DLNA server, hence no authentication and wide open. The expectation is that the storage used for storing your media files is directly attaced to the Raspberry PI.

Supervisor is used to start smd and nfs processes. The supervisor configuration file is expected to be stored in the same folder as the smb/nfs configuration files.

The following configuration files are used:
* smb.conf
* supervisord.conf

Update the /etc/exports file with location of the folder to share as well as the subnet/ips you allow NFS access. 

Clone this repository to obtain all files: https://github.com/robvde65/rpi-samba

## Usage
Prefix any config directive of minidlna with MINIDLNA_ and run your container:

sudo docker create --name rpi-samba --restart always --net=host -p 445:445 -p 139:139 -p 135:135/udp -p 137:137/udp -p 138:138/udp -p 111:111/udp -p 111:111/tcp -p 2049:2049/tcp -p 2049:2049/udp -v /mnt/mediadisk:/mnt/mediadisk -v /docker/rpi-samba:/etc/rpi-samba rpi-samba

sudo docker start rpi-samba



