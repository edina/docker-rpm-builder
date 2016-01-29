#!/bin/bash

version=3.3.3

fpm -v ${version} \
    --iteration 1.el6 \
    --epoch 1 \
    --vendor EDINA \
    --provides maven \
    -d jdk \
    -a noarch \
    -m andrew.seales@ed.ac.uk \
    -n maven \
    -s dir \
    -C /tmp/maven-${version} \
    --directories /opt/maven-${version} \
    --after-install post-install.sh \
    -t rpm \
    opt
