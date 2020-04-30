#!/bin/sh

exec exportfs -ra
exec update-rc.d rpcbind enable 
exec update-rc.d nfs-common enable
exec service rpcbind restart
exec service nfs-kernel-server restart