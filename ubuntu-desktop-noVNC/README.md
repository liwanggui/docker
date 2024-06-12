# Docker Ubuntu Desktop noVNC

## 环境说明

在 `Ubuntu 22.04` 基础上安装 `xfce4` 桌面环境、 `google-chrome` 浏览器、`tigervnc` 和 `noVNC` 及 `ibus` 中文输入法 (拼音和五笔)

- 支持浏览器访问 `VNC` 远程连接
- 支持 `VNC` 客户端工具远程连接
- 支持 `SSH` 远程连接

> [Dockerfile](https://github.com/liwanggui/docker/tree/main/ubuntu-desktop-noVNC/Dockerfile)

## 快速启动

```bash
docker run -d -p 2222:22 -p 5900:5900 -p 6080:6080 --name ubuntu-desktop-vnc liwanggui/ubuntu-desktop-novnc
```

浏览器访问 `http://<ip_address>:6080`

> 提示: 默认 vnc 密码: `admin123456`, 默认 root 用户密码: `root`

## docker compose

```yaml
version: '3.1'

services:
  ubuntu:
    image: liwanggui/ubuntu-desktop-novnc
    container_name: ubuntu
    restart: always
    environment:
      - VNCPASSWD=admin123      # 默认 admin123456
      - ROOT_PASSWORD=root@123  # 默认 root
    ports:
      - 2222:22
      - 6080:6080
      - 5900:5900
    volumes:
      - ./data:/root
```

## 输入法启用

执行以下命令启动输入法

```bash
# 启动 ibus
ibus-daemon -dr

# 启用拼音输入法
ibus engine pinyin

# 启用五笔输入法
ibus engine table:wubi-haifeng86

# 打开 ibus 输入法配置界面
ibus-setup 
```