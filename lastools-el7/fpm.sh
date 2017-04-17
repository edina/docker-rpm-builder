#!/bin/bash

version=170414

fpm -v ${version} \
    --iteration 1.el7 \
    --epoch 1 \
    --vendor EDINA \
    --provides lastools \
    -a x86_64 \
    -m john.pinto@ed.ac.uk \
    -n lastools \
    -s dir \
    -C /tmp/lastools\
    -t rpm \
    usr/local/bin
