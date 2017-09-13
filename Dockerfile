FROM node:8-alpine

# Install common libraries
RUN apk add --no-cache \
    su-exec

# Install nodemon
RUN mkdir -p /usr/lib/node_modules \
    && yarn global add nodemon forever evernote express express-jwt jwks-rsa body-parser  \
        --no-progress \
        --global-folder /usr/lib \
    && yarn cache clean \
    && chown -R node:node /usr/lib/node_modules \
    && rm -rf ~/.node-gyp /tmp/*

# Prepare workdir
RUN mkdir /app \
    && chown node:node /app
WORKDIR /app

# Default command
CMD ["forever", "start", "-c", "nodemon"]
