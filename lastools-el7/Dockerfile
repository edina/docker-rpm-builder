FROM centos:7

# Free LAS tools created for linux systems with "make". (Windows only free tools ignored.)
ENV FREE_LAS_TOOLS "las2las las2txt lasdiff lasindex lasinfo lasmerge lasprecision laszip txt2las"

RUN yum update -y && yum -y clean all
# Packages for building
RUN yum install -y wget git curl rubygems ruby-devel gcc gcc-c++ tar rpm-build make cmake unzip install
RUN gem install fpm -v 1.6.2 --no-ri --no-rdoc

WORKDIR "/root"

RUN wget --quiet http://lastools.org/download/laszip.zip
RUN unzip laszip.zip

WORKDIR "/root/LAStools" 
RUN make

WORKDIR "/root/LAStools/bin"

RUN mkdir -p  /tmp/lastools/usr/local/bin && cp ${FREE_LAS_TOOLS} /tmp/lastools/usr/local/bin/


WORKDIR "/root"
ADD fpm.sh /root/fpm.sh
RUN /root/fpm.sh