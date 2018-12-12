FROM centos:7

ENV version 2.138.4

RUN yum update -y && yum -y clean all
RUN yum install -y wget curl rubygems ruby-devel gcc gcc-c++ tar rpm-build make
RUN gem install fpm -v 1.10.2 --no-ri --no-rdoc

WORKDIR "/root"
RUN mkdir -p /tmp/jenkins-${version}/usr/share/java
RUN wget --quiet http://mirrors.jenkins.io/war-stable/${version}/jenkins.war -O /tmp/jenkins-${version}/usr/share/java/jenkins.war

ADD fpm.sh /root/fpm.sh
RUN /root/fpm.sh
