#!/bin/bash

version=2.2.0

fpm -v ${version} \
    --iteration 1.el7 \
    --epoch 1 \
    --vendor EDINA \
    --provides laszip \
    -a x86_64 \
    -m john.pinto@ed.ac.uk \
    -n laszip \
    -s dir \
    -C /tmp/laszip\
    -t rpm \
    usr/local/bin
