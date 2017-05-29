#!/bin/bash

docker build -t laszip_rpm_el7 .
docker run --rm  -v "$PWD/output":/output laszip_rpm_el7 bash -c "rm -f /output/*.rpm && cp /root/*.rpm /output"
