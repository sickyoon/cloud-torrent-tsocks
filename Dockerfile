FROM jpillora/cloud-torrent
LABEL maintainer="sick.yoon@gmail.com"

ENV TSOCKS_CONF_FILE /tsocks/tsocks.conf
RUN apk add --no-cache --virtual tsocks

ENTRYPOINT ["/usr/bin/tsocks", "/usr/local/bin/cloud-torrent"]
