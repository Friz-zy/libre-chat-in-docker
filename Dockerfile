FROM ghcr.io/danny-avila/librechat-dev:latest

USER root

RUN apk add --no-cache python3 py3-pip git chromium uv

RUN pip3 install --no-cache-dir \
    --break-system-packages --root-user-action ignore \
    mcp-server-fetch \
    mcp-server-git \
    mcp-server-sqlite

RUN npm install -g \
    @modelcontextprotocol/server-brave-search \
    @modelcontextprotocol/server-everart \
    @modelcontextprotocol/server-filesystem \
    @modelcontextprotocol/server-github \
    @modelcontextprotocol/server-gitlab \
    @modelcontextprotocol/server-gdrive \
    @modelcontextprotocol/server-google-maps \
    @modelcontextprotocol/server-memory \
    @modelcontextprotocol/server-postgres \
    @modelcontextprotocol/server-puppeteer \
    @modelcontextprotocol/server-sequential-thinking \
    @modelcontextprotocol/server-slack

USER node

CMD ["npm", "run", "backend"]
