FROM mapserver_rpm_el7:latest

RUN yum install -y epel-release swig autoconf cmake httpd-devel libpng-devel libjpeg-devel \
                   libjpeg-turbo-devel libcurl-devel libgeotiff-devel pcre-devel pixman-devel \
                   fcgi-devel sqlite-devel libtiff-devel libdb-devel && yum -y clean all

# Require mapserver support
RUN yum install -y /mapserver*.rpm

# Check out mapcache version 1.4
RUN git clone git://github.com/mapserver/mapcache.git /root/mapcache
WORKDIR "/root/mapcache"
RUN git checkout c5b4683039501a511be7b4e0aafb5ad745d5dbca

# Build with all options enabled.
# NB: WITH_TIFF_WRITE_SUPPORT has been enabled although there is a warning in the install guide
#     on it's use (http://www.mapserver.org/mapcache/install.html)
WORKDIR "/root/mapcache/build"
RUN cmake ..  -DWITH_PIXMAN=1 \
              -DWITH_SQLITE=1 \
              -DWITH_BERKELEY_DB=1 \
              -DWITH_MEMCACHE=1 \
              -DWITH_TIFF=1 \
              -DWITH_TIFF_WRITE_SUPPORT=1 \
              -DWITH_GEOTIFF=1 \
              -DWITH_PCRE=1 \
              -DWITH_MAPSERVER=1 \
              -DWITH_GEOS=1 \
              -DWITH_OGR=1 \
              -DWITH_CGI=1 \
              -DWITH_FCGI=1 \
              -DWITH_VERSION_STRING=1 \
              -DWITH_APACHE=1

RUN make && make install DESTDIR=/tmp/mapcache

WORKDIR "/"
ADD fpm-mapcache.sh /fpm-mapcache.sh
ADD after-install.sh /after-install.sh
RUN /fpm-mapcache.sh
