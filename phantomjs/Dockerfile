FROM centos:6

RUN yum update -y && yum -y clean all
RUN yum install -y wget curl rubygems ruby-devel gcc tar xz git rpm-build && yum -y clean all
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

# Stuff for git build
RUN yum -y install gcc gcc-c++ make flex bison gperf ruby \
                   openssl-devel freetype-devel fontconfig-devel libicu-devel sqlite-devel \
                   libpng-devel libjpeg-devel python-argparse && yum clean all

WORKDIR "/root"
RUN git clone git://github.com/ariya/phantomjs.git
WORKDIR "/root/phantomjs"
RUN git checkout 2.1.1 && git submodule init && git submodule update
RUN ./deploy/build-and-package.sh
RUN mkdir -p /tmp/phantomjs/usr/bin && cp ./bin/phantomjs /tmp/phantomjs/usr/bin/

WORKDIR "/root"
ADD fpm.sh /root/fpm.sh
RUN /root/fpm.sh

