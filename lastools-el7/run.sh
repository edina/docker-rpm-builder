#!/bin/bash

docker build -t lastools_rpm_el7 .
docker run --rm  -v "$PWD/output":/output lastools_rpm_el7 bash -c "rm -f /output/*.rpm && cp /root/*.rpm /output"
