# Use the official image as a parent image.
FROM arm32v7/alpine:latest

# Run the command inside your image filesystem.
RUN	apk --no-cache add samba-common-tools
RUN	apk --no-cache add samba-common-bin
RUN	apk --no-cache add samba-client
RUN	apk --no-cache add samba-server
RUN	apk --no-cache add nfs-kernel-server
RUN	apk --no-cache add nfs-common
RUN	apk --no-cache add rpcbind
RUN apk add --update bash && rm -rf /var/cache/apk/*

# Inform Docker that the container is listening on the specified port at runtime.
EXPOSE 137/udp 138/udp 139 445 111/udp 111/tcp 2049/tcp 2049/udp

# Place the run.sh that will create the config file and start the process.
ADD smb.sh /usr/local/bin/smb.sh
RUN chmod +x /usr/local/bin/*

# Create directory for mount point.
RUN mkdir /mnt/mediadisk

# Overwrite exports nfs configuration
COPY exports /etc/exports

# Update nfs configuration
RUN exportfs -ra
RUN update-rc.d rpcbind enable && sudo update-rc.d nfs-common enable

# Run script to prepare samba configu files
CMD /usr/local/bin/smb.sh