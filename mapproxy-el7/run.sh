#!/bin/bash

docker build -t mapproxy_rpm_el7 .
docker run --rm  -v "$PWD/output":/output mapproxy_rpm_el7 bash -c "cp /*.rpm /output"
