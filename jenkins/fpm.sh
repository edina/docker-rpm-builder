#!/bin/bash

version=2.138.2

fpm -v ${version} \
    --iteration 1.el7 \
    --epoch 1 \
    --vendor EDINA \
    --provides jenkins \
    -a noarch \
    -m john.pinto@ed.ac.uk \
    -n jenkins\
    -s dir \
   -C /tmp/jenkins-${version} \
    --directories /usr/share/java/ \
    -t rpm \
    usr/share/java
