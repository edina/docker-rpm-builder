#!/bin/bash

fpm -v 7.0.4 \
    --iteration 5.el7 \
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
    -d proj \
    -d libkml \
    -d gdal \
    -d fcgi \
    -d libxslt \
    -d librsvg2 \
    -d exempi \
    -d fribidi \
    -a x86_64 \
    -n mapserver \
    -s dir \
    -C /tmp/mapserver \
    -t rpm \
    --after-install after-install.sh \
    usr
