#!/bin/bash

docker build -t maven_rpm .
docker run --rm  -v "$PWD/output":/output maven_rpm bash -c "cp /root/*.rpm /output"
