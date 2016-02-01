#!/bin/bash

version=3.25.0

fpm -v ${version} \
    --iteration 1.el6 \
    --epoch 1 \
    --vendor EDINA \
    --provides newrelic_java \
    -a noarch \
    -m andrew.seales@ed.ac.uk \
    -n newrelic_java \
    -s dir \
    -C /tmp/newrelic-java-${version} \
    --directories /usr/share/java/newrelic \
    -t rpm \
    usr/share/java
