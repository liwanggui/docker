#!/bin/bash

# set root password
if [[ $ROOT_PASSWORD ]]; then
    echo "root:${ROOT_PASSWORD}" | chpasswd
fi

# config vnc
echo "xfce4-session" > ${HOME}/.xsession
mkdir -m 0700 ${HOME}/.vnc
vncpasswd -f <<<${VNCPASSWD}> ${HOME}/.vnc/passwd
chmod 0600 ${HOME}/.vnc/passwd

cat <<EOF>${HOME}/.vnc/config
session=xfce
geometry=$GEOMETRY
securitytypes=vncauth,tlsvnc
EOF

# set ibus and lang
sed -i '/GTK_IM_MODULE/d' ${HOME}/.bashrc
sed -i '/XMODIFIERS/d' ${HOME}/.bashrc
sed -i '/QT_IM_MODULE/d' ${HOME}/.bashrc
sed -i '/^export LANG/d'  ${HOME}/.bashrc

{
    echo 'export GTK_IM_MODULE=ibus'
    echo 'export XMODIFIERS=@im=ibus'
    echo 'export QT_IM_MODULE=ibus'
    echo 'export LANG=en_US.UTF-8'
    echo 'export LANGUAGE=en_US.UTF-8'
} >> ${HOME}/.bashrc

# start
/usr/sbin/sshd -D &
/usr/libexec/vncserver :0 &
/opt/noVNC-${NOVNC_VERSION}/utils/novnc_proxy $*
