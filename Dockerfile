FROM alpine:3.3

ENV DOCKER_GEN_VERSION=0.5.0
ENV DOWNLOAD_URL https://github.com/jwilder/docker-gen/releases/download/$DOCKER_GEN_VERSION/docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz
ENV DOCKER_HOST unix:///tmp/docker.sock

RUN apk add --update ca-certificates \
    && wget -O - $DOWNLOAD_URL | tar -C /usr/local/bin -xvz \
    && apk del ca-certificates && rm /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/docker-gen"]
