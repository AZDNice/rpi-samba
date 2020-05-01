# Use the official image as a parent image.
FROM arm32v7/alpine:3.11.6

# Run the command inside your image filesystem.
RUN apk --no-cache upgrade && \
    apk --no-cache add samba && \
    apk --no-cache add samba-common-tools && \
    apk --no-cache add supervisor

RUN apk --no-cache add openrc && \
    apk --no-cache add nfs-utils && \
    apk --no-cache add rpcbind

RUN apk add --update bash && rm -rf /var/cache/apk/*

# Inform Docker that the container is listening on the specified port at runtime.
EXPOSE 135/tcp 137/udp 138/udp 139 445 111/udp 111/tcp 2049/tcp 2049/udp

# Create directory for mount point.
RUN mkdir /mnt/mediadisk
RUN mkdir /etc/rpi-samba

# Overwrite exports nfs configuration
COPY exports /etc/exports

ENTRYPOINT ["supervisord", "-c", "/etc/rpi-samba/supervisord.conf"]