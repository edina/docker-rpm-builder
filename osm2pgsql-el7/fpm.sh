#!/bin/bash

version=0.96.0

fpm -v ${version} \
    --iteration 1.el7 \
    --epoch 1 \
    --vendor EDINA \
    --provides osm2pgsql \
    -a x86_64 \
    -n osm2pgsql \
    -s dir \
    -C /tmp/osm2pgsql \
    -t rpm \
    usr

