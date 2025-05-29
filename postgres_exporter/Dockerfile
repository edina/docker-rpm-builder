FROM rockylinux:9

RUN yum update -y && yum -y clean all
RUN yum install -y wget rubygems ruby-devel gcc gcc-c++ tar rpm-build make
RUN gem install fpm 

WORKDIR "/root"
RUN curl -L https://github.com/prometheus-community/postgres_exporter/releases/download/v0.17.1/postgres_exporter-0.17.1.linux-amd64.tar.gz > postgres_exporter.tar.gz
RUN tar -zxf postgres_exporter.tar.gz
RUN mkdir -p /tmp/postgres_exporter/usr/sbin
RUN mv postgres_exporter-0.17.1.linux-amd64/postgres_exporter /tmp/postgres_exporter/usr/sbin/

RUN mkdir -p /tmp/postgres_exporter/etc/sysconfig/
COPY postgres_exporter /tmp/postgres_exporter/etc/sysconfig/

COPY postgres_exporter.service /tmp/postgres_exporter/etc/systemd/system/

COPY fpm.sh /root/fpm.sh
RUN /root/fpm.sh
