FROM python:3.9-alpine
ENV TZ="Asia/Shanghai"

WORKDIR /tmp

RUN apk add --no-cache git curl \
    && git config --global --add safe.directory "*" \
    && git clone https://github.com/zhumengstarsea/FansMedalHelper /app/FansMedalHelper \
    && pip install --no-cache-dir -r /app/FansMedalHelper/requirements.txt \
    && rm -rf /tmp/*

WORKDIR /app/FansMedalHelper

ENTRYPOINT ["/bin/sh","/app/FansMedalHelper/docker-entrypoint.sh"]
