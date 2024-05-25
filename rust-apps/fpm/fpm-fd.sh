#!/bin/bash

fpm -v 10.1.0 \
    --iteration 2.el7 \
    --epoch 1 \
    --vendor EDINA \
    -a x86_64 \
    -n fd-find \
    -s dir \
    -t rpm \
    /usr/local/bin/fd
