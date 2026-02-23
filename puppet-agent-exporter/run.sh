#!/bin/bash

docker build -t puppet-agent-exporter .
docker run --rm  -v "$PWD/output":/output puppet-agent-exporter bash -c "rm -f /output/*.rpm && cp /root/*.rpm /output"
