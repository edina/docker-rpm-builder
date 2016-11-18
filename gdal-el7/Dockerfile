FROM centos:7

ENV version 2.1.2

RUN yum update -y && yum -y clean all
RUN yum install -y make wget curl rubygems ruby-devel gcc gcc-c++ tar rpm-build && yum -y clean all
RUN gem install cabin -v 0.9.0 --no-ri --no-rdoc
RUN gem install ffi -v 1.9.14 --no-ri --no-rdoc
RUN gem install addressable -v 2.5.0 --no-ri --no-rdoc
RUN gem install arr-pm -v 0.0.10 --no-ri --no-rdoc
RUN gem install backports -v 3.6.8 --no-ri --no-rdoc
RUN gem install childprocess -v 0.5.9 --no-ri --no-rdoc
RUN gem install clamp -v 1.1.1 --no-ri --no-rdoc
RUN gem install ftw -v 0.0.44 --no-ri --no-rdoc
RUN gem install http_parser.rb -v 0.6.0 --no-ri --no-rdoc
RUN gem install json -v 2.0.2 --no-ri --no-rdoc
RUN gem install fpm -v 1.6.3 --no-ri --no-rdoc
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# Packages for building
RUN yum install -y autoconf rpm-build libtool expat-devel curl-devel zlib-devel postgresql-devel libpng-devel libjpeg-devel giflib-devel xerces-c-devel sqlite-devel geos-devel libxml2-devel proj-devel proj-epsg git python-devel && yum -y clean all

# Stuff for libkml build
RUN git clone https://github.com/google/libkml.git /root/libkml
WORKDIR "/root/libkml"
# This is still the latest commit of libkml as of Nov 2016 
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


# GDAL build with support for python and FGBD
WORKDIR "/root"
RUN wget --quiet http://download.osgeo.org/gdal/${version}/gdal-${version}.tar.gz && tar -zxf gdal-${version}.tar.gz
WORKDIR "/root/gdal-${version}"
RUN ./configure --prefix=/usr --with-python --with-fgdb=/usr/local/FileGDB_API-64
RUN make -j$(nproc) && make install DESTDIR=/tmp/gdal && make clean && ldconfig

RUN mkdir /tmp/gdal/usr/lib/fileGDB && cp /usr/local/FileGDB_API-64/lib/*.so /tmp/gdal/usr/lib/fileGDB

WORKDIR "/"
ADD fpm-gdal.sh /fpm-gdal.sh
ADD after-install-gdal.sh /after-install-gdal.sh
RUN /fpm-gdal.sh
