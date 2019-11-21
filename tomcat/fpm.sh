#!/bin/bash

version=9.0.27

fpm -v ${version} \
    --iteration 1.el7 \
    --epoch 1 \
    --vendor EDINA \
    --provides tomcat9 \
    -a noarch \
    -m andrew.seales@ed.ac.uk \
    -n tomcat9 \
    -s dir \
    -C /tmp/tomcat \
    -t rpm \
    --before-install before-install.sh \
    --after-install after-install.sh \
    --before-remove before-remove.sh \
    --after-remove after-remove.sh \
    opt/tomcat \
    etc/systemd/system \
    etc/sysconfig
