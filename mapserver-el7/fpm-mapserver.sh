#!/bin/bash

fpm -v 2.1.0 \
    --iteration 1.el7 \
    --epoch 1 \
    --vendor EDINA \
    --provides mapserver \
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
    -d gdal \
    -d fcgi-devel \
    -d libxslt-devel \
    -d librsvg2-devel \
    -d exempi-devel \
    -d fribidi-devel \
    -a x86_64 \
    -n mapserver \
    -s dir \
    -C /tmp/mapserver \
    -t rpm \
    --after-install after-install.sh \
    usr
