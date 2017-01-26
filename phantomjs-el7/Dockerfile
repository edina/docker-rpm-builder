FROM centos:7

RUN echo "start"
RUN yum update -y && yum -y clean all
RUN yum install -y wget curl rubygems ruby-devel gcc tar xz git rpm-build libffi-devel && yum -y clean all
RUN yum -y install gcc gcc-c++ make flex bison gperf ruby \
                   openssl-devel freetype-devel fontconfig-devel libicu-devel sqlite-devel \
                   libpng-devel libjpeg-devel python-argparse && yum clean all

RUN gem install cabin --no-ri --no-rdoc
RUN gem install ffi --no-ri --no-rdoc
RUN gem install addressable --no-ri --no-rdoc
RUN gem install arr-pm --no-ri --no-rdoc
RUN gem install backports --no-ri --no-rdoc
RUN gem install childprocess --no-ri --no-rdoc
RUN gem install clamp --no-ri --no-rdoc
RUN gem install ftw --no-ri --no-rdoc
RUN gem install http_parser.rb --no-ri --no-rdoc
RUN gem install json --no-ri --no-rdoc
RUN gem install fpm --no-ri --no-rdoc

WORKDIR "/root"
RUN git clone git://github.com/ariya/phantomjs.git
WORKDIR "/root/phantomjs"
RUN git checkout 2.1.1 && git submodule init && git submodule update
RUN ./deploy/build-and-package.sh
RUN mkdir -p /tmp/phantomjs/usr/bin && cp ./bin/phantomjs /tmp/phantomjs/usr/bin/

WORKDIR "/root"
ADD fpm.sh /root/fpm.sh
RUN /root/fpm.sh

