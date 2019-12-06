FROM centos:7

ENV version 3.0.2

RUN yum update -y && yum -y clean all
RUN yum install -y make wget curl rubygems ruby-devel gcc gcc-c++ tar rpm-build && yum -y clean all
RUN gem install fpm --no-ri --no-rdoc
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# Packages for building
RUN yum install -y autoconf rpm-build libtool expat-devel curl-devel zlib-devel postgresql-devel libpng-devel libjpeg-devel giflib-devel xerces-c-devel sqlite-devel geos-devel libxml2-devel git python-devel java-1.8.0-openjdk-devel swig ant && yum -y clean all

# Stuff for libkml build
RUN git clone https://github.com/google/libkml.git /root/libkml
WORKDIR "/root/libkml"
# This is still the latest commit of libkml as of Mar 2018
RUN git checkout 8609edf7c8d13ae2ddb6eac2bca7c8e49c67a5f8

RUN ./autogen.sh && ./configure --prefix=/usr && make -j$(nproc)
RUN make install DESTDIR=/tmp/libkml

WORKDIR "/"
ADD fpm-libkml.sh /fpm-libkml.sh
ADD after-install-kml.sh /after-install-kml.sh
RUN /fpm-libkml.sh

RUN yum install -y /libkml*.rpm

# File Geodatabase API 1.4, which must be downloaded from http://appsforms.esri.com/products/download/index.cfm
# You must set up an account and agree to a licence before download, but the 1.4 version is included in the 
# git repository.
WORKDIR /root/filegdb
COPY filegdb_api_1_4-64.tar.gz filegdb_api_1_4-64.tar.gz
RUN tar -zxf filegdb_api_1_4-64.tar.gz
RUN mv FileGDB_API-64 /usr/local && echo '/usr/local/FileGDB_API-64/lib' >> /etc/ld.so.conf && ldconfig

# Need a locally built proj since proj 6 isn't in centos 7
WORKDIR /root/proj6
RUN wget --quiet https://download.osgeo.org/proj/proj-6.2.1.tar.gz
RUN tar -zxf proj-6.2.1.tar.gz
RUN wget --quiet https://download.osgeo.org/proj/proj-datumgrid-1.8.zip
RUN unzip -o proj-datumgrid-1.8.zip -d proj-6.2.1/data/
WORKDIR /root/proj6/proj-6.2.1
RUN ./configure && make -j$(nproc)
RUN make install DESTDIR=/tmp/proj6

WORKDIR /
ADD fpm-proj6.sh /
ADD after-install-proj6.sh /
RUN /fpm-proj6.sh

RUN yum install -y /proj6*.rpm

# GDAL build with support for python and FGBD
WORKDIR "/root"
RUN wget --quiet http://download.osgeo.org/gdal/${version}/gdal-${version}.tar.gz && tar -zxf gdal-${version}.tar.gz
WORKDIR "/root/gdal-${version}"
RUN ./configure --prefix=/usr/local --with-java --with-python --with-fgdb=/usr/local/FileGDB_API-64
RUN make -j$(nproc) && \
    make install DESTDIR=/tmp/gdal && \
    cd swig/java && \
    make && \
    make install DESTDIR=/tmp/gdal && \
    make clean && \
    cd ../../ && \
    make clean && \
    ldconfig

RUN mkdir /tmp/gdal/usr/lib/fileGDB && cp /usr/local/FileGDB_API-64/lib/*.so /tmp/gdal/usr/lib/fileGDB

WORKDIR "/"
ADD fpm-gdal.sh /fpm-gdal.sh
ADD after-install-gdal.sh /after-install-gdal.sh
RUN /fpm-gdal.sh
