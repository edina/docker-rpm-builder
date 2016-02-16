#!/bin/bash

fpm -v 1.3.0 \
    --iteration 1.el6 \
    --epoch 1 \
    --vendor EDINA \
    --provides libkml \
    -d curl \
    -d expat \
    -d zlib \
    -a x86_64 \
    -m andrew.seales@ed.ac.uk \
    -n libkml \
    -s dir \
    -C /tmp/libkml \
    -t rpm \
    usr
