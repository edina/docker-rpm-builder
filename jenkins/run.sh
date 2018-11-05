#!/bin/bash

docker build -t geo-jenkins .
docker run --rm  -v "$PWD/output":/output geo-jenkins bash -c "rm -f /output/*.rpm && cp /root/*.rpm /output"
