# Use the official Node.js base image
FROM ghcr.io/puppeteer/puppeteer

ARG USER=node

USER root

# node image default node user id is 1000
ARG UID=1000
ARG GID=1000
# default password for user
ARG PW=docker
# create user
RUN echo "$UID"
RUN if ! [ "$UID" -eq 1000 ]; then \
        useradd -m ${USER} --uid=${UID}; \
    fi

# Using unencrypted password/ specifying password
RUN "$(getent passwd ${UID} | cut -d: -f1):${PW}" | chpasswd

ENV HOME=/home/$USER
WORKDIR /home/$USER
USER ${UID}:${GID}

RUN \
    npm install jest puppeteer jest-puppeteer

WORKDIR /app

# Copy package.json and package-lock.json first to leverage Docker cache
COPY --chown=${UID}:${GID} end-to-end-test-tutorial/package*.json /app/

# Install the application's dependencies inside the container
RUN npm install

# Copy the rest of the application code into the container
COPY --chown=${UID}:${GID} end-to-end-test-tutorial /app

WORKDIR /app

# Specify the command to run your application
CMD [ "node", "server.js" ]
