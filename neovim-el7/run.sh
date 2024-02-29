#!/bin/bash

docker build -t nvim_builder . && \
  docker run --rm  -v "$PWD/output":/output nvim_builder bash -c "rm -f /output/*.rpm && cp /root/*.rpm /output"
