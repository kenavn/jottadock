FROM alpine:3.9
WORKDIR /tmp
RUN apk add --no-cache curl && \
    curl -O https://repo.jotta.us/archives/linux/x86/jotta-cli-0.5.15025_linux_x86.tar.gz && \
    tar -xf jotta-cli-0.5.15025_linux_x86.tar.gz -C / && \
    rm jotta-cli*.tar.gz && \
    mkdir /var/lib/jottad && \
    chown 1 /var/lib/jottad
USER 1
VOLUME [ "/var/lib/jottad" ]
CMD [ "jottad" ]
