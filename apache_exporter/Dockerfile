FROM centos:7

RUN yum update -y && yum -y clean all
RUN yum install -y wget curl rubygems ruby-devel gcc gcc-c++ tar rpm-build make
RUN gem install fpm --no-ri --no-rdoc

WORKDIR "/root"
RUN curl -L https://github.com/Lusitaniae/apache_exporter/releases/download/v0.7.0/apache_exporter-0.7.0.linux-amd64.tar.gz > apache_exporter.tar.gz
RUN tar -zxf apache_exporter.tar.gz
RUN mkdir -p /tmp/apache_exporter/usr/sbin
RUN mv apache_exporter-0.7.0.linux-amd64/apache_exporter /tmp/apache_exporter/usr/sbin/

RUN mkdir -p /tmp/apache_exporter/etc/sysconfig/
COPY apache_exporter /tmp/apache_exporter/etc/sysconfig/

COPY apache_exporter.service /tmp/apache_exporter/etc/systemd/system/

COPY fpm.sh /root/fpm.sh
RUN /root/fpm.sh
