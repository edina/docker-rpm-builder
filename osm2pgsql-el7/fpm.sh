#!/bin/bash

version=0.96.0

fpm -v ${version} \
    --iteration 2.el7 \
    --epoch 1 \
    --vendor EDINA \
    --provides osm2pgsql \
    -a x86_64 \
    -n osm2pgsql \
    -s dir \
    -C /tmp/osm2pgsql \
    -d boost \
    -d expat \
    -d zlib \
    -d bzip2 \
    -d proj \
    -d proj-epsg \
    -d lua \
    -d postgresql96 \
    -t rpm \
    usr

