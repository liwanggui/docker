FROM  alpine

ARG VERSION=v0.4.0
ARG TARGETARCH

LABEL author="liwanggui"

RUN apk add --no-cache iproute2 curl bash && \
    curl -fL https://github.com/cnrancher/kube-explorer/releases/download/$VERSION/kube-explorer-linux-${TARGETARCH} -o /usr/local/bin/kube-explorer && \
    chmod +x /usr/local/bin/kube-explorer

EXPOSE 9080 9443

CMD ["kube-explorer"]
