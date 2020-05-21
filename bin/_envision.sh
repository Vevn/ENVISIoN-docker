#!/bin/bash
cd ENVISIoN

export INVIWO_HOME=/home/docker/ENVISIoN/inviwo-build/bin
export ELECTRON_DISABLE_SANDBOX=1
export PYTHONIOENCODING=utf-8

npm run start
