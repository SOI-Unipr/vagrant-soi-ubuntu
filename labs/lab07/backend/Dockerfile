
# starting image: Node 12.16 (based on Alpine linux - a lightweight distribution)
FROM node:12.16-alpine

# Node server http port
EXPOSE 8000

# create folder for the logs (currently not used)
RUN mkdir -p /srv/logs

# logs folder is mapped to a volume, that can be "mounted" to a folder within the host file system
# every time a container is created from this image
VOLUME /srv/logs

# create directory for the application and its dependencies
RUN mkdir -p /usr/src/server

# set working directory for Docker commands
WORKDIR /usr/src/server

# extract (packed) sources into target folder
ADD todo-server-1.0.0.tgz /usr/src/server

# here there can be some copying of other files (e.g. configuration)
# COPY config/server.yml /usr/src/server

# the command to be executed upon container start (remember the working dir!)
# command line options can be put here (e.g. node src/server.js -c config.yml)
CMD node package/src/server.js
