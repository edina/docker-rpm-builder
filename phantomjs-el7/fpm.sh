#!/bin/bash

fpm -v 2.1.1 \
    --iteration 1.el7 \
    --epoch 1 \
    --vendor EDINA \
    --provides phantomjs \
    -a x86_64 \
    -m andrew.seales@ed.ac.uk \
    -n phantomjs \
    -s dir \
    -C /tmp/phantomjs \
    -t rpm \
    usr/bin/phantomjs
