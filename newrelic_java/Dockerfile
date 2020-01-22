FROM centos:7

ENV version 5.9.0

RUN yum update -y && yum -y clean all
RUN yum install -y wget curl rubygems ruby-devel gcc gcc-c++ tar rpm-build make
RUN gem install fpm --no-ri --no-rdoc

# Stuff for gdal build
WORKDIR "/root"
RUN wget --quiet https://download.newrelic.com/newrelic/java-agent/newrelic-agent/${version}/newrelic-java-${version}.zip -O newrelic-java-${version}.zip && unzip newrelic-java-${version}.zip

RUN mkdir -p /tmp/newrelic-java-${version}/usr/share/java && cp -r /root/newrelic /tmp/newrelic-java-${version}/usr/share/java/newrelic/

ADD fpm.sh /root/fpm.sh
RUN /root/fpm.sh

