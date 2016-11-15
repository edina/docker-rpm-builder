#!/bin/bash

fpm -v 2.1.2 \
    --iteration 1.el7 \
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
    -d expat \
    -d libxml2 \
    -d libkml \
    -a x86_64 \
    -n gdal \
    -s dir \
    -C /tmp/gdal \
    -t rpm \
    --after-install after-install.sh \
    usr
