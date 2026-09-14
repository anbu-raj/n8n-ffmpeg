FROM n8nio/n8n:2.10.2

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ffmpeg \
        curl \
        coreutils \
    && rm -rf /var/lib/apt/lists/*

USER node
