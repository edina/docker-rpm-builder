#!/bin/bash

docker build -t libkml_rpm .
docker run --rm  -v "$PWD/output":/output libkml_rpm bash -c "cp /*.rpm /output"
