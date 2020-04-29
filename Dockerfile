# Use the official image as a parent image.
FROM arm32v7/alpine:latest

# Run the command inside your image filesystem.
RUN	apk --no-cache add minidlna
RUN apk add --update bash && rm -rf /var/cache/apk/*

# Inform Docker that the container is listening on the specified port at runtime.
EXPOSE 1900/udp 8200

# Place the run.sh that will create the config file and start the process.
ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/*
ADD minidlna.conf /etc/minidlna.conf

# Create directory for mount point.
RUN mkdir /mnt/mediadisk

ENTRYPOINT ["run.sh"]