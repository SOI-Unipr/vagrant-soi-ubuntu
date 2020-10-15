#!/bin/bash

set -e
cd $(dirname $(readlink -f $0))

# persist docker image into a re-usable TAR file
# multiple containers can then be instanced starting from the same image
echo "Saving App Docker image..."
docker save maps/todo-app:latest > maps-todo-app.tar
echo "Docker image maps/todo-app:latest saved successfully: maps-todo-app.tar"

# NOTE: images can be listed through `docker image ls`
#       images can be remove through `docker image rm <image name or id>`
