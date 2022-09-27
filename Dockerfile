FROM        node:16.17.1-buster-slim

RUN         apt update \
            && apt -y install ffmpeg iproute2 git sqlite3 python3 ca-certificates tzdata dnsutils build-essential wget gnupg libcairo2-dev libjpeg-dev libcogl-pango-dev libgif-dev \
            && npm install -g npm@8.19.2 \
            && rm -rf /var/lib/apt/lists/* \

ENV         USER=container HOME=/home/container
WORKDIR     /home/container

RUN         groupadd -r container && useradd -d /home/container -r -g container -G audio,video container

USER        container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]