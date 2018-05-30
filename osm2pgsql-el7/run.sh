#!/bin/bash

docker build -t osm2pgsql_rpm_el7 .
docker run --rm  -v "$PWD/output":/output osm2pgsql_rpm_el7 bash -c "rm -f /output/*.rpm && cp /root/*.rpm /output"
