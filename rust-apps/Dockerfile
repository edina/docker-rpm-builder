FROM --platform=linux/amd64 centos:7

ENV version 7.2.0

RUN yum update -y && yum -y clean all
RUN yum install -y make wget curl rubygems ruby-devel gcc gcc-c++ tar rpm-build epel-release && yum -y clean all

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

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN source /root/.cargo/env

RUN /root/.cargo/bin/cargo install --root /usr/local --vers =14.1.0 ripgrep
RUN /root/.cargo/bin/cargo install --root /usr/local --vers =10.1.0 fd-find
RUN /root/.cargo/bin/cargo install --root /usr/local --vers =0.24.0 bat

WORKDIR "/"
ADD fpm/* /fpm/
RUN /fpm/fpm-bat.sh
RUN /fpm/fpm-rg.sh
RUN /fpm/fpm-fd.sh
