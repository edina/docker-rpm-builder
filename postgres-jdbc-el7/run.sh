#!/bin/bash

docker build -t pg_jdbc_el7_rpm .
docker run --rm  -v "$PWD/output":/output pg_jdbc_el7_rpm bash -c "rm -f /output/*.rpm && cp /root/*.rpm /output"
