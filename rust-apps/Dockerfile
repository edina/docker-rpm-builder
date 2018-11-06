FROM centos:7

ENV version 7.2.0

RUN yum update -y && yum -y clean all
RUN yum install -y make wget curl rubygems ruby-devel gcc gcc-c++ tar rpm-build epel-release && yum -y clean all
RUN gem install fpm --no-ri --no-rdoc
RUN yum install -y cargo && yum -y clean all

RUN cargo install --root /usr/local --vers =0.10.0 ripgrep
RUN cargo install --root /usr/local --vers =7.2.0 fd-find bat
RUN cargo install --root /usr/local --vers =0.8.0 bat

WORKDIR "/"
ADD fpm/* /fpm/
RUN /fpm/fpm-bat.sh
RUN /fpm/fpm-rg.sh
RUN /fpm/fpm-fd.sh
