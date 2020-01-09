#!/bin/bash

docker build -t activemq_builder . && \
  docker run --rm  -v "$PWD/output":/output activemq_builder bash -c "rm -f /output/*.rpm && cp /root/*.rpm /output"
