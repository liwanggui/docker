# alist

文件管理及网盘聚合工具

- Github: https://github.com/alist-org/alist
- Docker: https://hub.docker.com/r/liwanggui/alist

## Docker

```bash
docker container run -d -p 5244:5244 \
          -v /<path>/data:/opt/alist/data \
          --name alist \
          liwanggui/alist
```

> [Dockerfile](https://github.com/liwanggui/docker/tree/main/alist)
