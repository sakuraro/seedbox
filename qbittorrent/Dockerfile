FROM alpine:3.24
ARG NET_ENV=global
RUN if [ "$NET_ENV" = "cn" ]; then \
        sed -i 's#https\?://dl-cdn.alpinelinux.org/alpine#https://mirrors.tuna.tsinghua.edu.cn/alpine#g' /etc/apk/repositories \
    fi
RUN apk update \
    && apk add --no-cache qbittorrent-nox
CMD ["qbittorrent-nox", "--confirm-legal-notice", "--profile=/config"]
