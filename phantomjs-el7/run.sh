#!/bin/bash

docker build -t phantomjs_rpm .
docker run --rm  -v "$PWD/output":/output phantomjs_rpm bash -c "rm -f /output/*.rpm && cp /root/*.rpm /output"
