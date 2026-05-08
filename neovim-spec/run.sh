#!/bin/bash

docker build --platform linux/amd64 -t nvim_builder .
docker run --platform linux/amd64 --rm -v "$PWD/output":/output nvim_builder sh -c 'rm -f /output/*.rpm && cp /root/rpmbuild/RPMS/x86_64/*.rpm /output'
