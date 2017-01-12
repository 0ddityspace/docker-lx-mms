# docker-lx-mms
Mongo Management Studio Community on Alpine linux

## Run container
```bash
docker run -d \
    --name lx-mms \
    -v /data/lxmms:/root/.mms \
    -p 3333:3333 \
    0dittyspace/lx-mms
```
