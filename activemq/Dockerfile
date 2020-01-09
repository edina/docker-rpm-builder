FROM centos:7

RUN yum update -y && yum -y clean all
RUN yum install -y wget curl rubygems ruby-devel gcc gcc-c++ tar rpm-build make
RUN gem install fpm --no-ri --no-rdoc

ENV AMQ_VERSION=5.15.11

WORKDIR "/tmp"
RUN mkdir -p opt etc/systemd/system etc/sysconfig

RUN curl -L "http://www.apache.org/dyn/closer.cgi?filename=/activemq/${AMQ_VERSION}/apache-activemq-${AMQ_VERSION}-bin.tar.gz&action=download" > amq.tar.gz
RUN tar -zxf amq.tar.gz
RUN mv apache-activemq-${AMQ_VERSION} activemq && mv activemq opt/

ADD activemq.service /tmp/etc/systemd/system/
ADD activemq-envs /tmp/etc/sysconfig/activemq
ADD conf/* /tmp/etc/activemq/

ADD fpm.sh /root/fpm.sh
ADD before-install.sh /root/
ADD after-install.sh /root/
ADD before-remove.sh /root/
ADD after-remove.sh /root/

WORKDIR "/root"
RUN /root/fpm.sh
