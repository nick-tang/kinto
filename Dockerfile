FROM alpine

ENV CONFIG=https://raw.githubusercontent.com/nick-tang/kinto/master/config.json \
    TZ=Asia/Shanghai

RUN apk update && apk --no-cache add ca-certificates unzip tzdata && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    wget -c https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip v2ray-linux-64.zip && rm -f v2ray-linux-64.zip && \
    chmod 700 v2ray v2ctl
    
CMD ./v2ray -config $CONFIG
