#!/bin/bash

set -e
cd $(dirname $(readlink -f $0))

# build a new Docker image using the prescription in the current `Dockerfile`
# the name of the target image is "maps/todo-app", with a versioning tag optionally
# following ":" (default is "latest")
# NOTE: --rm means "Remove intermediate containers after a successful build"
echo "Building App Docker image..."
docker build --rm -t maps/todo-app .
echo "Docker image maps/todo-app built successfully"
