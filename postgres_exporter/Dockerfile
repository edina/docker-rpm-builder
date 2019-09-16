FROM centos:7

RUN yum update -y && yum -y clean all
RUN yum install -y wget curl rubygems ruby-devel gcc gcc-c++ tar rpm-build make
RUN gem install fpm --no-ri --no-rdoc

WORKDIR "/root"
RUN curl -L https://github.com/wrouesnel/postgres_exporter/releases/download/v0.5.1/postgres_exporter_v0.5.1_linux-amd64.tar.gz > postgres_exporter.tar.gz
RUN tar -zxf postgres_exporter.tar.gz
RUN mkdir -p /tmp/postgres_exporter/usr/sbin
RUN mv postgres_exporter_v0.5.1_linux-amd64/postgres_exporter /tmp/postgres_exporter/usr/sbin/

RUN mkdir -p /tmp/postgres_exporter/etc/sysconfig/
COPY postgres_exporter /tmp/postgres_exporter/etc/sysconfig/

COPY postgres_exporter.service /tmp/postgres_exporter/etc/systemd/system/

COPY fpm.sh /root/fpm.sh
RUN /root/fpm.sh
