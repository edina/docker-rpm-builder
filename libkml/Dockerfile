FROM centos:6

RUN yum update -y
RUN yum install -y wget curl rubygems ruby-devel gcc gcc-c++ tar rpm-build
RUN gem install --no-ri --no-rdoc fpm && gem uninstall cabin && gem install --no-ri --no-rdoc cabin -v 0.7.2
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm

# Stuff for git build
RUN yum install -y git
RUN git clone https://github.com/google/libkml.git /root/libkml
WORKDIR "/root/libkml"
RUN git checkout 8609edf7c8d13ae2ddb6eac2bca7c8e49c67a5f8

RUN yum install -y autoconf rpm-build libtool expat-devel curl-devel zlib-devel

RUN ./autogen.sh && ./configure --prefix=/usr && make -j$(nproc)
RUN make install DESTDIR=/tmp/libkml

WORKDIR "/"
ADD fpm.sh /fpm.sh
RUN /fpm.sh
