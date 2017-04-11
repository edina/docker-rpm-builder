#!/bin/bash

docker build -t jenkins .
docker run --rm  -v "$PWD/output":/output jenkins bash -c "rm -f /output/*.rpm && cp /root/*.rpm /output"
