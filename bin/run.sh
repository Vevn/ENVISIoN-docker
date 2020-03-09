#!/bin/bash
source ./bin/env.sh

docker run \
    --rm \
    --name envision \
    -e DISPLAY=$DISPLAY \
    -v $(pwd):/data \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -u docker \
    -it $DOCKER_PROJECT_NAME \
    $@
