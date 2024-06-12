#!/bin/bash

[ -d /root/.aria2 ] || mkdir -p /root/.aria2
[ -f /root/.aria2/aria2.conf ] ||  cp -rf /opt/aria2/* /root/.aria2

chown -R ${PUID}:${PGID} /opt/alist/

umask ${UMASK}

exec su-exec ${PUID}:${PGID} nohup aria2c \
  --enable-rpc \
  --rpc-allow-origin-all \
  --conf-path=/root/.aria2/aria2.conf \
  >/dev/null 2>&1 &

exec su-exec ${PUID}:${PGID} ./alist server --no-prefix
