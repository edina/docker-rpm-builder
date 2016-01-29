FROM centos:6

ENV version 1.11.3

RUN yum update -y
RUN yum install -y wget curl rubygems ruby-devel gcc gcc-c++ tar rpm-build
RUN gem install --no-ri --no-rdoc fpm && gem uninstall cabin && gem install --no-ri --no-rdoc cabin -v 0.7.2
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm

# Stuff for gdal build
RUN wget http://download.osgeo.org/gdal/${version}/gdal-${version}.tar.gz -O /gdal-${version}.tar.gz && tar -zxf /gdal-${version}.tar.gz
RUN yum install -y postgresql-devel libpng-devel libjpeg-devel giflib-devel xerces-c-devel curl-devel sqlite-devel geos-devel expat-devel libxml2-devel proj-devel proj-epsg

WORKDIR "/gdal-${version}"
RUN ./configure --prefix=/usr && make -j$(nproc)
RUN make install DESTDIR=/tmp/gdal

WORKDIR "/"
ADD fpm.sh /fpm.sh
RUN /fpm.sh

