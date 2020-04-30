#!/bin/sh

exec exportfs -ra
exec supervisord -c /etc/supervisor/supervisord.conf $@