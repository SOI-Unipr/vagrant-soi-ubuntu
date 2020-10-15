#!/bin/bash

set -e
cd $(dirname $(readlink -f $0))

# persist docker image into a re-usable TAR file
# multiple containers can then be instanced starting from the same image
echo "Saving Server Docker image..."
docker save maps/todo-server:latest > maps-todo-server.tar
echo "Docker image maps/todo-server:latest saved successfully: maps-todo-server.tar"

# NOTE: images can be listed through `docker image ls`
#       images can be remove through `docker image rm <image name or id>`
