#!/bin/bash

version=0.17.1

fpm -v ${version} \
    --iteration 1.el9 \
    --epoch 1 \
    --vendor EDINA \
    --provides postgres_exporter \
    -a x86_64 \
    -m andrew.seales@ed.ac.uk \
    -n postgres_exporter \
    -s dir \
   -C /tmp/postgres_exporter \
    -t rpm \
    usr/sbin \
    etc/sysconfig \
    etc/systemd/system
