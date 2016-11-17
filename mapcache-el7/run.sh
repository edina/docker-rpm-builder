#!/bin/bash

docker build -t mapcache_rpm_el7 .
docker run --rm  -v "$PWD/output":/output mapcache_rpm_el7 bash -c "cp /*.rpm /output"
