FROM centos:6

ENV version 1.11.3

RUN yum update -y && yum -y clean all
RUN yum install -y wget curl rubygems ruby-devel gcc gcc-c++ tar rpm-build && yum -y clean all
RUN gem install cabin -v 0.6.1 --no-ri --no-rdoc
RUN gem install ffi -v 1.9.3 --no-ri --no-rdoc
RUN gem install addressable -v 2.3.5 --no-ri --no-rdoc
RUN gem install arr-pm -v 0.0.8 --no-ri --no-rdoc
RUN gem install backports -v 3.3.5 --no-ri --no-rdoc
RUN gem install childprocess -v 0.3.9 --no-ri --no-rdoc
RUN gem install clamp -v 0.6.3 --no-ri --no-rdoc
RUN gem install ftw -v 0.0.38 --no-ri --no-rdoc
RUN gem install http_parser.rb -v 0.6.0 --no-ri --no-rdoc
RUN gem install json -v 1.8.1 --no-ri --no-rdoc
RUN gem install fpm -v 1.0.1 --no-ri --no-rdoc
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm

# Packages for building
RUN yum install -y autoconf rpm-build libtool expat-devel curl-devel zlib-devel postgresql-devel libpng-devel libjpeg-devel giflib-devel xerces-c-devel sqlite-devel geos-devel libxml2-devel proj-devel proj-epsg git && yum -y clean all

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
RUN mkdir /root/gdal-${version} && wget --quiet http://download.osgeo.org/gdal/${version}/gdal-${version}.tar.gz -O /root/gdal-${version}.tar.gz && tar -zxf /root/gdal-${version}.tar.gz -C /root

WORKDIR "/root/gdal-${version}"
RUN ./configure --prefix=/usr && make -j$(nproc)
RUN make install DESTDIR=/tmp/gdal

WORKDIR "/"
ADD fpm-gdal.sh /fpm-gdal.sh
RUN /fpm-gdal.sh

