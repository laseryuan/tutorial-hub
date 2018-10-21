FROM node:8

# Create app directory
WORKDIR /usr/src/app

RUN npm install -g nodemon

COPY app/package*.json ./

RUN npm install

USER node

# Bundle app source
COPY --chown=node app .