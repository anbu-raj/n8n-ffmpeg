
FROM n8nio/n8n:2.10.2

USER root

RUN apk add --no-cache \
    ffmpeg \
    curl \
    coreutils

USER node
