#!/bin/bash

fpm -v 1.4 \
    --iteration 1.el7 \
    --epoch 1 \
    --vendor EDINA \
    --provides mapcache \
    -d httpd \
    -d libpng \
    -d libjpeg \
    -d libtiff \
    -d giflib \
    -d curl \
    -d sqlite \
    -d fcgi \
    -d pixman \
    -d pcre \
    -d libdb \
    -d libgeotiff \
    -d libkml \
    -d gdal \
    -d mapserver \
    -a x86_64 \
    -n mapcache \
    -s dir \
    -C /tmp/mapcache \
    -t rpm \
    --after-install after-install.sh \
    usr
