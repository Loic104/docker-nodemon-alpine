FROM node:8-alpine

# Install common libraries
RUN apk add --no-cache \
    su-exec

# Install libraries
RUN npm install -g forever evernote express express-jwt jwks-rsa body-parser

# Prepare workdir
RUN mkdir /app
WORKDIR /app

# Default command
CMD ["forever", "-wv", "server.js"]
