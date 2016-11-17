#!/bin/bash

docker build -t gdal_rpm_el7 .
docker run --rm  -v "$PWD/output":/output gdal_rpm_el7 bash -c "rm -f /output/*.rpm && cp /*.rpm /output"
