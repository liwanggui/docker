# alist aria2

文件管理及网盘聚合工具, 增加 aria2 下载功能

- Github: https://github.com/alist-org/alist
- Docker: https://hub.docker.com/r/liwanggui/alist-aria2

## Docker 

```bash
docker container run -d -p 5244:5244 \
          -v /<path>/data:/opt/alist/data \
          -v /<path>/aria2:/root/.aria2 \
          --name alist-aria2 \
          liwanggui/alist-aria2
```

> [Dockerfile](https://github.com/liwanggui/docker/tree/main/alist-aria2)
