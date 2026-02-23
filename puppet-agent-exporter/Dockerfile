FROM rockylinux:9

RUN yum update -y && yum -y clean all
RUN yum install -y wget rubygems ruby-devel gcc gcc-c++ tar rpm-build make
RUN gem install fpm 

WORKDIR "/root"
RUN curl -L https://github.com/retailnext/puppet-agent-exporter/releases/download/v0.2.4/puppet-agent-exporter_0.2.4_linux_amd64.tar.gz > puppet-agent-exporter.tar.gz
RUN tar -zxf puppet-agent-exporter.tar.gz
RUN mkdir -p /tmp/puppet-agent-exporter/usr/local/bin
RUN mv puppet-agent-exporter /tmp/puppet-agent-exporter/usr/local/bin/

COPY puppet-agent-exporter.service /tmp/puppet-agent-exporter/etc/systemd/system/

COPY fpm.sh /root/fpm.sh
RUN /root/fpm.sh
