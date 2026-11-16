FROM alpine:3.24
RUN sed -i 's#https\?://dl-cdn.alpinelinux.org/alpine#https://mirrors.tuna.tsinghua.edu.cn/alpine#g' /etc/apk/repositories \
    && apk update \
    && apk add --no-cache qbittorrent-nox
CMD ["qbittorrent-nox", "--confirm-legal-notice", "--profile=/config"]
