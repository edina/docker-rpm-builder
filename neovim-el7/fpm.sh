#!/bin/bash

version=0.9.5

fpm -v ${version} \
    --iteration 1.el7 \
    --epoch 1 \
    --vendor EDINA \
    --provides neovim \
    -a x86_64 \
    -m andrew.seales@ed.ac.uk \
    -n neovim \
    -s dir \
    -C /tmp \
    -t rpm \
    usr
