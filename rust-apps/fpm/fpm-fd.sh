#!/bin/bash

fpm -v 7.2.0 \
    --iteration 1.el7 \
    --epoch 1 \
    --vendor EDINA \
    -a x86_64 \
    -n fd-find \
    -s dir \
    -t rpm \
    /usr/local/bin/fd
