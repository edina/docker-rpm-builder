FROM gdal_rpm_el7:latest

ENV version 7.0.5

RUN yum install -y epel-release swig autoconf cmake postgresql-devel expat-devel fcgi-devel \
  freetype-devel fribidi-devel gcc gcc-c++ geos-devel giflib-devel git harfbuzz-devel \
  libcurl-devel libjpeg-devel libjpeg-turbo-devel libpng-devel libtiff-devel \
  libtool libxml2-devel pixman-devel postgresql95-devel postgis2_95-devel proj-devel \
  proj-epsg python-devel rpm-build ruby-devel rubygems sqlite-devel tar wget xerces-c-devel \
  zlib-devel libxslt-devel librsvg2-devel exempi-devel && yum -y clean all

RUN yum install -y /gdal*.rpm

WORKDIR /root
RUN wget http://download.osgeo.org/mapserver/mapserver-${version}.tar.gz && tar -zxf mapserver-${version}.tar.gz

WORKDIR mapserver-${version}/build
# To build a static version use -DBUILD_STATIC=1 -DLINK_STATIC_LIBMAPSERVER=1
RUN cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
             -DWITH_CURL=1 -DWITH_FCGI=1 -DWITH_PYTHON=1 \
             -DWITH_CLIENT_WMS=1 -DWITH_CLIENT_WFS=1 -DWITH_GIF=1 -DWITH_WFS=1 \
             -DWITH_SOS=1 -DWITH_GDAL=1 -DWITH_OGR=1 -DWITH_WCS=1 -DWITH_PIXMAN=1 \
             -DWITH_XMLMAPFILE=1 -DWITH_RSVG=1 -DWITH_EXEMPI=1 -DWITH_CAIRO=1 \
             -DWITH_CSHARP=0 -DWITH_PHP=0 -DWITH_PERL=0 -DWITH_RUBY=0 -DWITH_MYSQL=0
             
RUN make && make install DESTDIR=/tmp/mapserver

WORKDIR "/"
ADD after-install.sh /after-install.sh
ADD fpm-mapserver.sh /fpm-mapserver.sh
RUN /fpm-mapserver.sh
