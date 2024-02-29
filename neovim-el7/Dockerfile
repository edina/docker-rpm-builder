FROM --platform=linux/amd64 centos:7

RUN yum update -y && yum -y clean all
RUN yum install -y wget curl rubygems ruby-devel gcc gcc-c++ tar rpm-build make

RUN gem install cabin -v 0.9.0 --no-ri --no-rdoc
RUN gem install ffi -v 1.9.14 --no-ri --no-rdoc
RUN gem install addressable -v 2.5.0 --no-ri --no-rdoc
RUN gem install arr-pm -v 0.0.10 --no-ri --no-rdoc
RUN gem install backports -v 3.6.8 --no-ri --no-rdoc
RUN gem install childprocess -v 0.5.9 --no-ri --no-rdoc
RUN gem install clamp -v 1.1.1 --no-ri --no-rdoc
RUN gem install ftw -v 0.0.44 --no-ri --no-rdoc
RUN gem install http_parser.rb -v 0.6.0 --no-ri --no-rdoc
RUN gem install json -v 2.0.2 --no-ri --no-rdoc
RUN gem install ruby-xz -v 0.2.3 --no-ri --no-rdoc
RUN gem install dotenv -v 2.8.1 --no-ri --no-rdoc
RUN gem install fpm -v 1.6.3 --no-ri --no-rdoc

ENV NVIM_VERSION=0.9.5

WORKDIR "/tmp"

RUN curl -L "https://github.com/neovim/neovim/releases/download/v${NVIM_VERSION}/nvim-linux64.tar.gz" > nvim.tar.gz

RUN tar -zxf nvim.tar.gz
RUN mkdir -p usr/local
RUN mv nvim-linux64/* usr/local/

ADD fpm.sh /root/fpm.sh

WORKDIR "/root"
RUN /root/fpm.sh
