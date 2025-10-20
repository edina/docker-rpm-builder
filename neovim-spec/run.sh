#!/bin/bash

docker build -t nvim_builder .
docker run --rm -v "$PWD/output":/output nvim_builder sh -c 'rm -f /output/*.rpm && cp /root/rpmbuild/RPMS/x86_64/*.rpm /output'
