FROM centos:6

ENV version 3.3.3

RUN yum update -y
RUN yum install -y wget curl rubygems ruby-devel gcc gcc-c++ tar rpm-build
RUN gem install --no-ri --no-rdoc fpm && gem uninstall cabin && gem install --no-ri --no-rdoc cabin -v 0.7.2
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm

# Stuff for gdal build
WORKDIR "/root"
RUN wget http://mirror.ox.ac.uk/sites/rsync.apache.org/maven/maven-3/${version}/binaries/apache-maven-${version}-bin.tar.gz -O apache-maven-${version}.tar.gz && tar -zxf apache-maven-${version}.tar.gz

RUN mkdir -p /tmp/maven-${version}/opt && cp -r /root/apache-maven-${version} /tmp/maven-${version}/opt/maven-${version}/

ADD fpm.sh /root/fpm.sh
ADD post-install.sh /root/post-install.sh
RUN /root/fpm.sh

