FROM centos:6

RUN yum update -y
RUN yum install -y wget curl rubygems ruby-devel gcc 
RUN gem install --no-ri --no-rdoc fpm
RUN yum install -y tar xz git

# Stuff for git build
RUN yum install -y openssl-devel autoconf git rpm-build curl-devel expat-devel gettext xmlto asciidoc perl-ExtUtils-MakeMaker
RUN git clone https://github.com/git/git.git /root/git

WORKDIR "/root/git"

RUN git checkout v2.7.4
RUN make rpm

