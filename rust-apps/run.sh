#!/bin/bash

docker build -t rust-apps .
docker run --rm  -v "$PWD/output":/output rust-apps bash -c "rm -f /output/*.rpm && cp /*.rpm /output"
