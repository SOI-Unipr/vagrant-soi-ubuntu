#!/bin/bash

CONTAINER_PORT=80  # as  exposed in Dockerfile through EXPOSE directive

if [ $# -lt 1 ]; then
    echo "Usage: $0 <host-port>"
    exit 1
fi

host_port="$1"

num_re='^[0-9]+$'
if ! [[ $host_port =~ $num_re ]]; then
    echo "ERROR: invalid host port number"
    exit 2
fi

# instance container called "todo-app" with port binding
# starting from Docker image "maps/todo-app:latest"
cont_id=$(docker create -p "$host_port":$CONTAINER_PORT --name todo-app maps/todo-app:latest)
echo "Container created: $cont_id"

# NOTE: all containers can be listed through `docker ps -a` (`docker ps` shows running container)
#       containers can be remove through `docker rm <container name or id>`

# To start the newly created container, type `docker start todo-app` (`docker stop todo-app` to stop it).
# Through `docker ps`, you should see something like this:
#   CONTAINER ID        IMAGE                     COMMAND                  CREATED              STATUS              PORTS                    NAMES
#   509ddffc8c12        maps/todo-app:latest      "docker-entrypoint..."   About a minute ago   Up 5 seconds        0.0.0.0:8080->80/tcp       todo-app
# (assuming create_container was called binding internal port 80 to external 8080)
# Now the frontend service (HTTP server) should be available: try browsing to `localhost:8080`
