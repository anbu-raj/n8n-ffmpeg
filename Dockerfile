FROM node:22-bookworm-slim

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ffmpeg \
        curl \
        ca-certificates \
        tini \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g n8n@2.10.2

RUN mkdir -p /home/node/.n8n \
    && chown -R node:node /home/node

USER node

ENV N8N_USER_FOLDER=/home/node/.n8n

WORKDIR /home/node

EXPOSE 5678

ENTRYPOINT ["tini", "--"]

CMD ["n8n"]
