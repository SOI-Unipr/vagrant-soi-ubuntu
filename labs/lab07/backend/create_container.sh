#!/bin/bash

CONTAINER_PORT=8000  # as  exposed in Dockerfile through EXPOSE directive
CONTAINER_LOGS_DIR=/srv/logs  # as set in Dockerfile through VOLUME directive

if [ $# -lt 2 ]; then
    echo "Usage: $0 <host-port> <logs-dir>"
    exit 1
fi

host_port="$1"
logs_dir="$2"

num_re='^[0-9]+$'
if ! [[ $host_port =~ $num_re ]]; then
    echo "ERROR: invalid host port number"
    exit 2
fi

if ! [ -d "$logs_dir" ]; then
    echo "ERROR: log directory path does not point to a directory"
    exit 3
fi

logs_dir=$(readlink -f "$logs_dir")

# instance container called "todo-server" with port binding and volume mounting
# starting from Docker image "maps/todo-server:latest"
cont_id=$(docker create -p "$host_port":$CONTAINER_PORT -v "$logs_dir":$CONTAINER_LOGS_DIR --name todo-server maps/todo-server:latest)
echo "Container created: $cont_id"

# NOTE: all containers can be listed through `docker ps -a` (`docker ps` shows running container)
#       containers can be remove through `docker rm <container name or id>`

# To start the newly created container, type `docker start todo-server` (`docker stop todo-server` to stop it).
# Through `docker ps`, you should see something like this:
#   CONTAINER ID        IMAGE                     COMMAND                  CREATED              STATUS              PORTS                    NAMES
#   509ddffc8c12        maps/todo-server:latest   "docker-entrypoint..."   About a minute ago   Up 5 seconds        0.0.0.0:8888->8000/tcp   todo-server
# (assuming create_container was called binding internal port 8000 to external 8888)
# Now the backend service should be available: try `curl localhost:8888/tasks`
