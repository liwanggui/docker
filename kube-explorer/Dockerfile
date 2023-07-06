FROM  alpine:3.18.2

LABEL version="v0.3.2"
LABEL author="liwanggui"

ARG VERSION="v0.3.2"

RUN apk add --no-cache iproute2 curl bash && \
    curl -sfL https://github.com/cnrancher/kube-explorer/releases/download/$VERSION/kube-explorer-linux-amd64 -o /usr/local/bin/kube-explorer && \
    chmod +x /usr/local/bin/kube-explorer

EXPOSE 9080 9443

CMD ["kube-explorer"]
