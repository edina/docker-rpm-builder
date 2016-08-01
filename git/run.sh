#!/bin/bash

docker build -t git_rpm .
docker run --rm  -v "$PWD/output":/output git_rpm bash -c "cp /root/rpmbuild/RPMS/x86_64/*.rpm /output"
