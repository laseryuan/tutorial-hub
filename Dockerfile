FROM node:10

# Create app directory
WORKDIR /usr/src/app
RUN chown node:node /usr/src/app

# Create node_modules symlink target directory
RUN mkdir /usr/src/node_modules
RUN chown node:node /usr/src/node_modules

RUN npm install -g create-react-app

USER node

RUN ln -s ../node_modules /usr/src/app/node_modules

COPY --chown=node app/package*.json ./
RUN npm install

COPY --chown=node app .
