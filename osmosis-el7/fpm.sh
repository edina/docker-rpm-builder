#!/bin/bash

version=0.46

fpm -v ${version} \
    --iteration 1.el7 \
    --epoch 1 \
    --vendor EDINA \
    --provides osmosis \
    -a x86_64 \
    -n osmosis \
    -s dir \
    -C /tmp/osmosis \
    -t rpm \
    usr