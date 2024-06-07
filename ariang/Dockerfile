FROM nginx:stable-alpine

ARG VERSION=1.3.7 
#ARG GHPROXY=https://gh.wglee.org/

# RUN  sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
RUN  apk add --no-cache curl bash && \
     curl -sL ${GHPROXY}https://github.com/mayswind/AriaNg/releases/download/${VERSION}/AriaNg-${VERSION}-AllInOne.zip -o /tmp/AriaNg.zip && \
     unzip -o  /tmp/AriaNg.zip -d /usr/share/nginx/html && /bin/rm -f /tmp/AriaNg.zip
