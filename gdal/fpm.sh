#!/bin/bash

fpm -v 1.11.3 \
    --iteration 5.el6 \
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
    -a x86_64 \
    -m andrew.seales@ed.ac.uk \
    -n gdal \
    -s dir \
    -C /tmp/gdal \
    -t rpm \
    --after-install after-install.sh \
    usr
