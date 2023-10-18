# Use the official Node.js base image
FROM node:18

ARG USER=node

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

# Install latest chrome dev package and fonts to support major charsets (Chinese, Japanese, Arabic, Hebrew, Thai and a few others)
# Note: this installs the necessary libs to make the bundled version of Chrome that Puppeteer
# installs, work.
RUN apt-get update \
    && apt-get install -y wget gnupg \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/googlechrome-linux-keyring.gpg \
    && sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/googlechrome-linux-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-khmeros fonts-kacst fonts-freefont-ttf libxss1 dbus dbus-x11 \
      --no-install-recommends \
    && service dbus start \
    && rm -rf /var/lib/apt/lists/*

# install chrome version that work with crconsole
ENV \
CHROME_VERSION="103.0.5060.134-1"

RUN \
wget --no-verbose -O /tmp/chrome.deb https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${CHROME_VERSION}_amd64.deb \
  && apt install -y --allow-downgrades /tmp/chrome.deb \
  && rm /tmp/chrome.deb

RUN \
npm install crconsole -g

ENV HOME=/home/$USER

USER ${UID}:${GID}

# Install node modules in parent directory
WORKDIR /home/$USER/node_app

# Copy package.json and package-lock.json first to leverage Docker cache
COPY --chown=${UID}:${GID} end-to-end-test-tutorial/package*.json ./

# Install the application's dependencies inside the container
RUN \
npm install locus && \
npm install --no-optional && npm cache clean --force

ENV PATH=/home/$USER/node_app/node_modules/.bin:$PATH

WORKDIR /home/$USER/node_app/app
# Copy the rest of the application code into the container
COPY --chown=${UID}:${GID} end-to-end-test-tutorial .

# WORKDIR /app

# Specify the command to run your application
CMD [ "node", "server.js" ]
