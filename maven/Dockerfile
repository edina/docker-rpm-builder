FROM centos:6

ENV version 3.3.3

RUN yum update -y && yum -y clean all
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

# Stuff for gdal build
WORKDIR "/root"
RUN wget --quiet https://archive.apache.org/dist/maven/maven-3/${version}/binaries/apache-maven-${version}-bin.tar.gz -O apache-maven-${version}.tar.gz && tar -zxf apache-maven-${version}.tar.gz

RUN mkdir -p /tmp/maven-${version}/opt && cp -r /root/apache-maven-${version} /tmp/maven-${version}/opt/maven-${version}/

ADD fpm.sh /root/fpm.sh
ADD post-install.sh /root/post-install.sh
RUN /root/fpm.sh

