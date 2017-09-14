FROM node:8-alpine

# Install common libraries
RUN apk add --no-cache \
    su-exec

# Install libraries
RUN npm install -g forever


VOLUME ["/app"]
WORKDIR /app

EXPOSE 3001

ENTRYPOINT npm install; forever -w server.js
