#!/bin/bash

version=0.7.0

fpm -v ${version} \
    --iteration 1.el7 \
    --epoch 1 \
    --vendor EDINA \
    --provides apache_exporter \
    -a x86_64 \
    -m andrew.seales@ed.ac.uk \
    -n apache_exporter \
    -s dir \
   -C /tmp/apache_exporter \
    -t rpm \
    usr/sbin \
    etc/sysconfig \
    etc/systemd/system
