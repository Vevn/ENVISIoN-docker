#!/bin/bash
source ./bin/env.sh

docker build -t $DOCKER_PROJECT_NAME $@ .
