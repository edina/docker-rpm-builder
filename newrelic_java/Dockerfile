FROM centos:6

ENV version 3.25.0

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
RUN wget --quiet https://download.newrelic.com/newrelic/java-agent/newrelic-agent/3.25.0/newrelic-java-${version}.zip -O newrelic-java-${version}.zip && unzip newrelic-java-${version}.zip

RUN mkdir -p /tmp/newrelic-java-${version}/usr/share/java && cp -r /root/newrelic /tmp/newrelic-java-${version}/usr/share/java/newrelic/

ADD fpm.sh /root/fpm.sh
RUN /root/fpm.sh

