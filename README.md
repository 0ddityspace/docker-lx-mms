# docker-lx-mms
Mongo Management Studio Community on Alpine linux

## Run container
```bash
docker run -d \
    --name lx-mms \
    -v /data/lxmms:/root/.mms \
    -e PORT=3333 \
    -p 3333:3333 \
    0dittyspace/lx-mms
```
