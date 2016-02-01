FROM centos:6

ENV version 3.25.0

RUN yum update -y
RUN yum install -y wget curl rubygems ruby-devel gcc gcc-c++ tar rpm-build
RUN gem install --no-ri --no-rdoc fpm && gem uninstall cabin && gem install --no-ri --no-rdoc cabin -v 0.7.2
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm

# Stuff for gdal build
WORKDIR "/root"
RUN wget https://download.newrelic.com/newrelic/java-agent/newrelic-agent/3.25.0/newrelic-java-${version}.zip -O newrelic-java-${version}.zip && unzip newrelic-java-${version}.zip

RUN mkdir -p /tmp/newrelic-java-${version}/usr/share/java && cp -r /root/newrelic /tmp/newrelic-java-${version}/usr/share/java/newrelic/

ADD fpm.sh /root/fpm.sh
RUN /root/fpm.sh

