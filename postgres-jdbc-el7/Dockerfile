FROM centos:7

RUN yum update -y && yum -y clean all
RUN yum install -y wget curl rubygems ruby-devel gcc gcc-c++ tar rpm-build make
RUN gem install fpm -v 1.6.2 --no-ri --no-rdoc

# Stuff for gdal build
WORKDIR "/root"
RUN mkdir -p /tmp/postgresql-jdbc/usr/share/java
RUN wget --quiet https://jdbc.postgresql.org/download/postgresql-9.4.1208.jar -O /tmp/postgresql-jdbc/usr/share/java/postgresql-jdbc.jar

ADD fpm.sh /root/fpm.sh
RUN /root/fpm.sh

