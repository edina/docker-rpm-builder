#!/bin/bash

fpm -v 14.1.0 \
    --iteration 2.el7 \
    --epoch 1 \
    --vendor EDINA \
    -a x86_64 \
    -n ripgrep \
    -s dir \
    -t rpm \
    /usr/local/bin/rg
