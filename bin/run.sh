#!/bin/bash
source ./bin/env.sh

xhost +local:docker
docker run \
    --rm \
    --name envision \
    -e DISPLAY=$DISPLAY \
    -v $(pwd):/home/docker/ENVISIoN \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -u docker \
    -it $DOCKER_PROJECT_NAME \
    $@
