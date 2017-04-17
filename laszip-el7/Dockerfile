FROM centos:7

ENV version 2.2.0
RUN yum update -y && yum -y clean all
# Packages for building
RUN yum install -y wget git curl rubygems ruby-devel gcc gcc-c++ tar rpm-build make cmake unzip install
RUN gem install fpm -v 1.6.2 --no-ri --no-rdoc
RUN echo "LASzip"
# Steps from http://scigeo.org/articles/howto-install-latest-geospatial-software-on-linux.html#compile_laszip
WORKDIR "/root"


RUN wget --quiet http://lastools.org/download/laszip.zip
RUN unzip laszip.zip

RUN mkdir -p  /tmp/laszip/usr/local/bin

WORKDIR "/root/LAStools"

RUN make 
# Copy laszip binary
RUN cp -r ./bin/laszip /tmp/laszip/usr/local/bin

RUN pwd
WORKDIR "/root"
ADD fpm.sh /root/fpm.sh
RUN /root/fpm.sh