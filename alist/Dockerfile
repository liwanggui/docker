FROM  alpine:3.18.2

LABEL author="liwanggui"

ARG VERSION="v3.20.1"
ARG INSTALL_DIR="/opt/alist" 

WORKDIR $INSTALL_DIR

ENV PUID=0 PGID=0 UMASK=022

COPY entrypoint.sh /entrypoint.sh

RUN apk add --no-cache iproute2 curl bash ca-certificates su-exec tzdata && \
    mkdir -p $INSTALL_DIR && \
    curl -sfL https://github.com/alist-org/alist/releases/download/${VERSION}/alist-linux-musl-amd64.tar.gz -o /tmp/alist.tar.gz && \
    tar xzvf /tmp/alist.tar.gz -C ${INSTALL_DIR} && \
    rm -f /tmp/alist.tar.gz && \
    chmod +x ${INSTALL_DIR}/alist /entrypoint.sh


EXPOSE 5244 5245

CMD [ "/entrypoint.sh" ]
