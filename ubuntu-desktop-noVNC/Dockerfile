FROM ubuntu:22.04

LABEL author="liwanggui"
LABEL email="liwanggui@163.com"

ARG GHPROXY
ARG TIGERVNC_VERSION=1.13.1 
ARG NOVNC_VERSION=1.4.0
ARG ROOT_PASSWORD=root

USER root
WORKDIR /root

# 禁用 apt 安装软件时的交互操作
ENV DEBIAN_FRONTEND=noninteractive

COPY start.sh /opt/start.sh

RUN sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list && \
    apt update && yes | unminimize && \
    # tools
    apt install -y sudo file git wget vim curl net-tools iputils-ping traceroute gedit iproute2 bzip2 unzip zip locales mysql-client bash-completion && \
    # ssh 
    apt install -y openssh-client openssh-server && \
    mkdir -p /var/run/sshd && \
    sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \ 
    # xfce4
    apt install -y xrdp xfce4 xfce4-terminal && \ 
    # ibus
    apt install -y ibus ibus-pinyin ibus-table-wubi fonts-wqy-zenhei && \
    # tigerVnc
    wget -qO- https://nchc.dl.sourceforge.net/project/tigervnc/stable/${TIGERVNC_VERSION}/tigervnc-${TIGERVNC_VERSION}.x86_64.tar.gz | tar xz --strip 1 -C / && \
    # noVNC
    curl -sL ${GHPROXY}https://github.com/novnc/noVNC/archive/refs/tags/v${NOVNC_VERSION}.tar.gz | tar xz -C /opt && \
    cd /opt/noVNC-${NOVNC_VERSION} && ln -sf vnc.html index.html && \
    git clone --depth=1 ${GHPROXY}https://github.com/novnc/websockify /opt/noVNC-${NOVNC_VERSION}/utils/websockify && \
    # google-chrome
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt-get install -y -f ./google-chrome-stable_current_amd64.deb && \
    sed -e '/chrome/ s/^#*/#/' -i /opt/google/chrome/google-chrome && \
    echo 'exec -a "$0" "$HERE/chrome" "$@" --user-data-dir="$HOME/.config/chrome" --no-sandbox --disable-dev-shm-usage' >> /opt/google/chrome/google-chrome && \
    rm -f google-chrome-stable_current_amd64.deb && \
    # telegram 
    apt install -y telegram-desktop && \
    # set root password
    echo "root:${ROOT_PASSWORD}" | chpasswd && \
    chmod +x /opt/start.sh && \
    # clean
    apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN LANG=C xdg-user-dirs-update --force

#LC_ALL=zh_CN.UTF-8
ENV TIGERVNC_VERSION=1.13.1 \
    NOVNC_VERSION=1.4.0 \
    VNCPASSWD=admin123456 \
    GEOMETRY=1366x768 \
    TZ=Asia/Shanghai \
    LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN.UTF-8 \
    IBUS_ENABLE_SYNC_MODE=1 \
    GTK_IM_MODULE=ibus \
    QT_IM_MODULE=ibus \
    XMODIFIERS=@im=ibus

EXPOSE 22 6080 5900

CMD ["/opt/start.sh"]

