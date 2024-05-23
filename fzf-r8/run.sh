#!/bin/bash

docker build -t fzf_builder . && \
  docker run --rm  -v "$PWD/output":/output fzf_builder bash -c "rm -f /output/*.rpm && cp /root/*.rpm /output"
