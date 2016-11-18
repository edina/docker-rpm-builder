#!/bin/bash

docker build -t gdal_rpm .
docker run --rm  -v "$PWD/output":/output gdal_rpm bash -c "rm -f /output/*.rpm && cp /*.rpm /output"
