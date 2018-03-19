#!/bin/bash

fpm -v 2.2.3 \
    --iteration 3.el7 \
    --epoch 1 \
    --vendor EDINA \
    --provides gdal \
    -d postgresql \
    -d libpng \
    -d libjpeg \
    -d giflib \
    -d xerces-c \
    -d curl \
    -d sqlite \
    -d geos \
    -d expat \
    -d libxml2 \
    -d proj-epsg \
    -d proj-devel \
    -d libkml \
    -a x86_64 \
    -n gdal \
    -s dir \
    -C /tmp/gdal \
    -t rpm \
    --after-install after-install-gdal.sh \
    usr
