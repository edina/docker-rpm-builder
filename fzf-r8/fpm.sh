#!/bin/bash

version=0.52.1

fpm -v ${version} \
    --iteration 1.el7 \
    --epoch 1 \
    --vendor EDINA \
    --provides fzf \
    -a x86_64 \
    -m andrew.seales@ed.ac.uk \
    -n fzf \
    -s dir \
    -C /tmp \
    -t rpm \
    usr
