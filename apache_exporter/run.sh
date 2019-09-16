#!/bin/bash

docker build -t apache_exporter .
docker run --rm  -v "$PWD/output":/output apache_exporter bash -c "rm -f /output/*.rpm && cp /root/*.rpm /output"
