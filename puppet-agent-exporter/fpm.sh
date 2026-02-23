#!/bin/bash

version=1.2.4

fpm -v ${version} \
    --iteration 1.el9 \
    --epoch 1 \
    --vendor EDINA \
    --provides puppet-agent-exporter \
    -a x86_64 \
    -m nick.dan@ed.ac.uk \
    -n puppet-agent-exporter \
    -s dir \
   -C /tmp/puppet-agent-exporter \
    -t rpm \
    usr/local/bin \
    etc/systemd/system
