#!/bin/bash

docker build -t postgres_exporter .
docker run --rm  -v "$PWD/output":/output postgres_exporter bash -c "rm -f /output/*.rpm && cp /root/*.rpm /output"
