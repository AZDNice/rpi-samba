#!/bin/sh

exec exportfs -ra
exec update-rc.d rpcbind enable && sudo update-rc.d nfs-common enable