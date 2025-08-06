#!/bin/bash

docker build -t node-exporter_builder .
docker run --rm -v "$PWD/output":/output node-exporter_builder sh -c 'rm -f /output/*.rpm && cp /root/rpmbuild/RPMS/x86_64/*.rpm /output'
