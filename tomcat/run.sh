#!/bin/bash

docker build -t edina_tomcat_rpm .
docker run --rm  -v "$PWD/output":/output edina_tomcat_rpm bash -c "rm -f /output/*.rpm && cp /root/*.rpm /output"
