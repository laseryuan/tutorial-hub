FROM lasery/ride:latest as BUILD
USER root
RUN chown root:root -R /home/ride

FROM gitpod/workspace-full:latest
# FROM timbru31/ruby-node

# Gitpod: start
USER root
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -yq \
      bash-completion git vim \
      locales tmux ack-grep
COPY --from=BUILD --chown=33333:33333 /home/ride /tmp/gitpod
# Gitpod: end

# Install firebase
RUN npm install --global npm firebase firebase-tools
