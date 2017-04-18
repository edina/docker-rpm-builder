#!/bin/bash

# The version can be captured by running a LAStools binary, e.g.,
# > laszip -version
# The output we get is of the form:
# "LAStools (by martin@rapidlasso.com) version 170414"
# For some unknown reason, the output is redirected to the stderr (file descriptor 2).
# So we capture it as follows.s
version_output=$(/root/LAStools/bin/laszip -version 2>&1)
# The version is last in the text, so we reverse the text, get the reversed version substring,
# and then reverse this again.
version=$(echo $version_output | rev | cut -d' ' -f1 | rev)
echo "LasTools version: $version"

fpm -v ${version} \
    --iteration 1.el7 \
    --epoch 1 \
    --vendor EDINA \
    --provides lastools \
    -a x86_64 \
    -m john.pinto@ed.ac.uk \
    -n lastools \
    -s dir \
    -C /tmp/lastools\
    -t rpm \
    usr/local/bin
