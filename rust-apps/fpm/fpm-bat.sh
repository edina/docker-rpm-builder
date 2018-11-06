#!/bin/bash

fpm -v 0.8.0 \
    --iteration 1.el7 \
    --epoch 1 \
    --vendor EDINA \
    -a x86_64 \
    -n bat \
    -s dir \
    -t rpm \
    /usr/local/bin/bat
