#!/bin/sh

cat > /etc/samba/smb.conf <<EOF
[global]
workgroup = WORKGROUP
log file = /var/log/samba/log.%m
max log size = 1000
logging = file
panic action = /usr/share/samba/panic-action %d
server role = standalone server
obey pam restrictions = yes
unix password sync = yes
passwd program = /usr/bin/passwd %u
passwd chat = *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:* %n\n *password\supdated\ssuccessfully* .
pam password change = yes
map to guest = bad user
usershare allow guests = yes
force directory mode = 0755
browsable = yes
writable = yes
guest account = root
force user = root
force group = root
[homes]
comment = Home Directories
browseable = no
read only = yes
create mask = 0700
directory mask = 0700
valid users = %S
[Videos]
path = /mnt/mediadisk/Videos
writeable=yes
create mask=0777
directory mask=0777
public=yes
guest ok = yes
EOF

