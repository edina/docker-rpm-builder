# osm2pgsql
# Using this because it has Ruby pre-installed 
# as we were having trouble installing Ruby version >= 2.4.0 
# (which is required for the fpm gem).
FROM drecom/centos-ruby

ENV version 0.96.0

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum install -y https://yum.postgresql.org/9.6/redhat/rhel-7.3-x86_64/pgdg-centos96-9.6-3.noarch.rpm
RUN yum update -y && yum -y clean all
RUN yum install -y make wget tar rpm-build git \
cmake make gcc gcc-c++ boost-devel \
expat-devel patch readline readline-devel zlib zlib-devel \
bzip2-devel libyaml-devel openssl bzip2 \
autoconf automake libtool bison iconv-devel sqlite-devel  && yum -y clean all

# Install Postgres & dependencies
RUN yum install -y postgresql96 postgresql96-server postgresql96-contrib postgresql96-libs postgresql96-contrib postgresql96-devel proj-devel proj-epsg proj lua-devel && yum -y clean all


# Install fpm and dependencies
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
RUN gem install fpm -v 1.6.3 --no-ri --no-rdoc

# osm2pgsql
WORKDIR "/root"
RUN git clone git://github.com/openstreetmap/osm2pgsql.git
WORKDIR "/root/osm2pgsql"
RUN git fetch --all --tags --prune
RUN git checkout "${version}"

WORKDIR "/root/osm2pgsql/build"
RUN cmake ..
RUN make && make install DESTDIR=/tmp/osm2pgsql



WORKDIR "/root"
RUN ls /root
ADD fpm.sh /root/fpm.sh
RUN /root/fpm.sh
RUN ls /root