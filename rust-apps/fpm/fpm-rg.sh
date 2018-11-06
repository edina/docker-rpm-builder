#!/bin/bash

fpm -v 0.10.0 \
    --iteration 1.el7 \
    --epoch 1 \
    --vendor EDINA \
    -a x86_64 \
    -n ripgrep \
    -s dir \
    -t rpm \
    /usr/local/bin/rg
