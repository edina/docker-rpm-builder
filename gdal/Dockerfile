FROM centos:6

ENV version 1.11.3

RUN yum update -y
RUN yum install -y wget curl rubygems ruby-devel gcc gcc-c++ tar rpm-build
RUN gem install --no-ri --no-rdoc fpm && gem uninstall cabin && gem install --no-ri --no-rdoc cabin -v 0.7.2
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm

# Packages for building
RUN yum install -y autoconf rpm-build libtool expat-devel curl-devel zlib-devel postgresql-devel libpng-devel libjpeg-devel giflib-devel xerces-c-devel sqlite-devel geos-devel libxml2-devel proj-devel proj-epsg git

# Stuff for libkml build
RUN git clone https://github.com/google/libkml.git /root/libkml
WORKDIR "/root/libkml"
RUN git checkout 8609edf7c8d13ae2ddb6eac2bca7c8e49c67a5f8

RUN ./autogen.sh && ./configure --prefix=/usr && make -j$(nproc)
RUN make install DESTDIR=/tmp/libkml

WORKDIR "/"
ADD fpm-libkml.sh /fpm-libkml.sh
ADD after-install.sh /after-install.sh
RUN /fpm-libkml.sh

RUN yum install -y /libkml*.rpm

# Stuff for gdal build
RUN mkdir /root/gdal-${version} && wget http://download.osgeo.org/gdal/${version}/gdal-${version}.tar.gz -O /root/gdal-${version}.tar.gz && tar -zxf /root/gdal-${version}.tar.gz -C /root

WORKDIR "/root/gdal-${version}"
RUN ./configure --prefix=/usr && make -j$(nproc)
RUN make install DESTDIR=/tmp/gdal

WORKDIR "/"
ADD fpm-gdal.sh /fpm-gdal.sh
RUN /fpm-gdal.sh

