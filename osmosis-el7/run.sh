#!/bin/bash

docker build -t osmosis_rpm_el7 .
docker run --rm  -v "$PWD/output":/output osmosis_rpm_el7 bash -c "rm -f /output/*.rpm && cp /root/*.rpm /output"
