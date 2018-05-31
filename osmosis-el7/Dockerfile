# osmosis
# Using this because it has Ruby pre-installed 
# as we were having trouble installing Ruby version >= 2.4.0 
# (which is required for the fpm gem).
FROM drecom/centos-ruby:2.5.1

ENV version 0.46
RUN yum update -y && yum -y clean all
RUN yum install -y wget curl gcc gcc-c++ tar rpm-build make

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

WORKDIR "/root"
RUN wget --quiet http://bretth.dev.openstreetmap.org/osmosis-build/osmosis-latest.zip -O osmosis-latest.zip
WORKDIR "/root/osmosis/usr/local/share/osmosis"
RUN unzip /root/osmosis-latest.zip
WORKDIR "/root/osmosis/usr/local/bin"
# Create a symlink to /usr/local/bin from  /usr/share/osmosis/bin/osmosis
RUN ln -s ../../share/osmosis/bin/osmosis  osmosis
RUN ls -l /root/osmosis/usr/local/bin
WORKDIR "/root"

RUN cp -r osmosis /tmp/osmosis

ADD fpm.sh /root/fpm.sh
RUN /root/fpm.sh
