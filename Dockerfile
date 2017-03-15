FROM alpine:3.5
MAINTAINER Mohammad Abdoli Rad <m.abdolirad@gmail.com>

ENV SS_SERVER_ADDR=0.0.0.0 \
    SS_SERVER_PORT=8388 \
    SS_PASSWORD=ssp@ss \
    SS_METHOD=aes-256-cfb \
    SS_TIMEOUT=300

RUN echo '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing/' >> /etc/apk/repositories \
    && apk update \
    && apk --no-cache add shadowsocks-libev@testing \
    && rm -rf /var/cache/apk/*

EXPOSE ${SS_SERVER_PORT}/tcp ${SS_SERVER_PORT}/udp

ENTRYPOINT /usr/bin/ss-server -s ${SS_SERVER_ADDR} -p ${SS_SERVER_PORT} -k ${SS_PASSWORD} -m ${SS_METHOD} -t ${SS_TIMEOUT}