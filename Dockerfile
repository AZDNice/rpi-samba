# Use the official image as a parent image.
FROM arm32v7/alpine:latest

# Run the command inside your image filesystem.
RUN apk --no-cache upgrade
RUN apk --no-cache add openrc
RUN	apk --no-cache add samba
RUN	apk --no-cache add samba-common-tools
RUN	apk --no-cache add nfs-utils
RUN	apk --no-cache add rpcbind
RUN	apk --no-cache add supervisor
RUN apk add --update bash && rm -rf /var/cache/apk/*

# Inform Docker that the container is listening on the specified port at runtime.
EXPOSE 135/tcp 137/udp 138/udp 139 445 111/udp 111/tcp 2049/tcp 2049/udp

# Place the run.sh that will create the config file and start the process.
ADD smb.sh /usr/local/bin/smb.sh
ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/*

# Create directory for mount point.
RUN mkdir /mnt/mediadisk

# Create directory for supervisor.
RUN mkdir /etc/supervisor
COPY supervisord.conf /etc/supervisor/supervisord.conf

# Overwrite exports nfs configuration
COPY exports /etc/exports

# Run script to prepare samba configu files
CMD /usr/local/bin/smb.sh

ENTRYPOINT ["run.sh"]