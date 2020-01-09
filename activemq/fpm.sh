#!/bin/bash

version=5.15.11

fpm -v ${version} \
    --iteration 2.el7 \
    --epoch 1 \
    --vendor EDINA \
    --provides activemq \
    -a noarch \
    -m andrew.seales@ed.ac.uk \
    -n activemq \
    -s dir \
    -C /tmp \
    -t rpm \
    --before-install before-install.sh \
    --after-install after-install.sh \
    --before-remove before-remove.sh \
    --after-remove after-remove.sh \
    opt \
    etc/systemd/system \
    etc/sysconfig \
    etc/activemq
