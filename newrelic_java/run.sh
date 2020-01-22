#!/bin/bash

docker build -t newrelic_java_rpm . && docker run --rm  -v "$PWD/output":/output newrelic_java_rpm bash -c "rm -f /output/*.rpm && cp /root/*.rpm /output"
