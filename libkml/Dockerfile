FROM centos:6

RUN yum update -y
RUN yum install -y wget curl rubygems ruby-devel gcc gcc-c++ tar rpm-build
RUN gem install cabin -v 0.6.1 --no-ri --no-rdoc
RUN gem install ffi -v 1.9.3 --no-ri --no-rdoc
RUN gem install addressable -v 2.3.5 --no-ri --no-rdoc
RUN gem install arr-pm -v 0.0.8 --no-ri --no-rdoc
RUN gem install backports -v 3.3.5 --no-ri --no-rdoc
RUN gem install childprocess -v 0.3.9 --no-ri --no-rdoc
RUN gem install clamp -v 0.6.3 --no-ri --no-rdoc
RUN gem install ftw -v 0.0.38 --no-ri --no-rdoc
RUN gem install http_parser.rb -v 0.6.0 --no-ri --no-rdoc
RUN gem install json -v 1.8.1 --no-ri --no-rdoc
RUN gem install fpm -v 1.0.1 --no-ri --no-rdoc
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
