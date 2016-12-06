#!/bin/bash

# NB: the below disables the python-pyymal dependency since this package is 
# called PyYAML on CentOS. The disable and then adding of the PyYAML as a 
# dependency looks strange but had trouble with the PyYAML dependency 
# without the disable switch.

fpm -v 1.9.0 \
    --iteration 3.el7 \
    --epoch 1 \
    --vendor EDINA \
    --provides mapproxy \
    --python-disable-dependency python-pyyaml \
    --python-disable-dependency PyYAML \
    -d proj-devel \
    -d 'python-pillow >= 2' \
    -d 'python-shapely >= 1.2.0' \
    -d python-lxml \
    -d gdal \
    -d PyYAML \
    -d python-setuptools \
    -d python-virtualenv \
    -s python \
    -t rpm \
    -n mapproxy \
    -a x86_64 \
    MapProxy

