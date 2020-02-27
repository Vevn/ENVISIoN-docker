#!/bin/sh
xhost +local:docker
./bin/run.sh ./inviwo-build/bin/inviwo
