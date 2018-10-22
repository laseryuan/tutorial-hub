FROM node:10

# Create app directory
WORKDIR /usr/src/app

COPY app/package*.json ./

RUN npm install

USER node

# Bundle app source
COPY --chown=node app .
