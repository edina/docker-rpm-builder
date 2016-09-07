FROM centos:7

RUN yum update -y && yum -y clean all
RUN yum install -y wget curl rubygems ruby-devel gcc tar xz git && yum -y clean all

# Stuff for mod_jk build
RUN yum install -y httpd-devel apr apr-devel apr-util apr-util-devel gcc gcc-c++ make autoconf libtool rpm-build pcre-devel java-1.6.0-openjdk-devel && yum -y clean all

WORKDIR "/"
ADD apache2-mod_jk.spec /root/rpmbuild/SPECS/apache2-mod_jk.spec
ADD jk.conf /root/rpmbuild/SOURCES/jk.conf
ADD README.SUSE /root/rpmbuild/SOURCES/README.SUSE
RUN wget --quiet http://archive.apache.org/dist/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.41-src.tar.gz -O /root/rpmbuild/SOURCES/tomcat-connectors-1.2.41-src.tar.gz
RUN rpmbuild -ba /root/rpmbuild/SPECS/apache2-mod_jk.spec

