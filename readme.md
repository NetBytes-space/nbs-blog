# nbs-blog

A hugo site for nbs blog.

[Go Look](https://netbytes.space)

## Build & Push

```bash
docker build -t public/nbs-blog:latest .
docker image tag public/nbs-blog:latest registry.netbytes.space/public/nbs-blog:latest
docker image push registry.netbytes.space/public/nbs-blog:latest
```
