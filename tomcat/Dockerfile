FROM centos:7

RUN yum update -y && yum -y clean all
RUN yum install -y wget curl rubygems ruby-devel gcc gcc-c++ tar rpm-build make
RUN gem install fpm --no-ri --no-rdoc

WORKDIR "/root"

RUN curl -L http://apache.mirrors.nublue.co.uk/tomcat/tomcat-9/v9.0.27/bin/apache-tomcat-9.0.27.tar.gz > apache-tomcat.tar.gz
RUN tar -zxf apache-tomcat.tar.gz
RUN mkdir -p /tmp/tomcat/opt/tomcat
RUN mv /root/apache-tomcat-9.0.27/* /tmp/tomcat/opt/tomcat/

RUN mkdir -p /tmp/tomcat/etc/systemd/system
ADD tomcat.service /tmp/tomcat/etc/systemd/system/tomcat.service

ADD fpm.sh /root/
ADD before-install.sh /root/
ADD after-install.sh /root/
ADD before-remove.sh /root/
ADD after-remove.sh /root/

RUN /root/fpm.sh
