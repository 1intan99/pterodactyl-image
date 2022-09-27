FROM        node:16.13.0-alpine

WORKDIR     /app

RUN         apk add --no-cache build-base g++ cairo-dev jpeg-dev pango-dev giflib-dev python3 ffmpeg ca-certificates  \
            && npm install -g npm@latest \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]