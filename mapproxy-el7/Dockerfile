FROM gdal_rpm_el7:latest

ENV version 1.11.0 

RUN yum update -y && yum -y clean all
RUN yum install -y python-setuptools

WORKDIR "/"
ADD fpm-mapproxy.sh /fpm-mapproxy.sh
RUN /fpm-mapproxy.sh
