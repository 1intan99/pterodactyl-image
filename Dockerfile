FROM        node:16-alpine

WORKDIR     /app

RUN         apk add --no-cache fontconfig ffmpeg bash iproute2 git sqlite sqlite-dev python3 python3-dev ca-certificates tzdata zip tar curl g++ make cairo-dev jpeg-dev pango-dev giflib-dev python3 ffmpeg ca-certificates build-base \
            && apk add --update --repository http://dl-3.alpinelinux.org/alpine/edge/testing libmount ttf-dejavu ttf-droid ttf-freefont ttf-liberation fontconfig \
            && npm install -g npm@latest \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]