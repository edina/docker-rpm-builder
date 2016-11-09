#!/bin/bash

docker build -t mapserver_rpm .
docker run --rm  -v "$PWD/output":/output mapserver_rpm bash -c "cp /*.rpm /output"
