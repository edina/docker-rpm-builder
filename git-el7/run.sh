#!/bin/bash

docker build -t git_el7_rpm .
docker run --rm  -v "$PWD/output":/output git_el7_rpm bash -c "rm -f /output/*.rpm && cp /root/rpmbuild/RPMS/x86_64/*.rpm /output"
