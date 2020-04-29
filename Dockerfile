# Use the official image as a parent image.
FROM arm32v7/alpine:latest

# Run the command inside your image filesystem.
RUN	apk --no-cache add samba-common-bin
RUN	apk --no-cache add samba
RUN apk add --update bash && rm -rf /var/cache/apk/*

# Inform Docker that the container is listening on the specified port at runtime.
EXPOSE 137/udp 138/udp 139 445

# Place the run.sh that will create the config file and start the process.
ADD smb.sh /usr/local/bin/smb.sh
RUN chmod +x /usr/local/bin/*

# Create directory for mount point.
RUN mkdir /mnt/mediadisk

ENTRYPOINT ["smb.sh"]