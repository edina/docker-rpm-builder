FROM --platform=linux/amd64 rockylinux:8

RUN yum update -y && yum -y clean all
RUN yum install -y wget curl rubygems ruby-devel gcc gcc-c++ tar rpm-build make

RUN gem install dotenv -v 2.8.1 -N
RUN gem install clamp -v 1.0.1 -N
RUN gem install mustache -v 0.99.8 -N
RUN gem install cabin insist stud arr-pm backports rexml -N
RUN gem install pleaserun --ignore-dependencies -N
RUN gem install fpm --ignore-dependencies -N

ENV NVIM_VERSION=0.10.4

WORKDIR "/tmp"

RUN curl -L "https://github.com/neovim/neovim-releases/releases/download/v${NVIM_VERSION}/nvim-linux-x86_64.tar.gz" > nvim.tar.gz

RUN tar -zxf nvim.tar.gz
RUN mkdir -p usr/local
RUN mv nvim-linux-x86_64/* usr/local/

ADD fpm.sh /root/fpm.sh

WORKDIR "/root"
RUN /root/fpm.sh
