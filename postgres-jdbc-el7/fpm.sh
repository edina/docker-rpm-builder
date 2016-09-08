#!/bin/bash

version=9.4.1208

fpm -v ${version} \
    --iteration 1.el7 \
    --epoch 1 \
    --vendor EDINA \
    --provides postgresql-jdbc \
    -a noarch \
    -m andrew.seales@ed.ac.uk \
    -n postgresql-jdbc \
    -s dir \
    -C /tmp/postgresql-jdbc \
    -t rpm \
    usr/share/java/
