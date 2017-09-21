FROM node:6-alpine

ENV NODE_ENV production

# Install common libraries
RUN apk add --no-cache \
    su-exec

# Install libraries
RUN npm install -g forever

# prepare directory
RUN mkdir /app
VOLUME ["/app"]
WORKDIR /app

EXPOSE 3001

ENTRYPOINT npm install; forever -w server.js
