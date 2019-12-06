#!/bin/bash

fpm -v 6.2.1 \
    --iteration 1.el7 \
    --epoch 1 \
    --vendor EDINA \
    --provides proj6 \
    -a x86_64 \
    -m andrew.seales@ed.ac.uk \
    -n proj6 \
    -s dir \
    -C /tmp/proj6 \
    -t rpm \
    --after-install after-install-proj6.sh \
    usr/local
