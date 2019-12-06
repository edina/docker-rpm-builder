#!/bin/bash

fpm -v 3.0.2 \
    --iteration 1.el7 \
    --epoch 1 \
    --vendor EDINA \
    --provides gdal3 \
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
    -d proj6 \
    -d libkml \
    -a x86_64 \
    -n gdal3 \
    -s dir \
    -C /tmp/gdal \
    -t rpm \
    --after-install after-install-gdal.sh \
    usr
