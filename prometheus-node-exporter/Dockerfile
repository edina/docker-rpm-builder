FROM rockylinux:9

RUN dnf update -y && dnf -y clean all
RUN dnf install -y systemd-rpm-macros wget rpmdevtools && dnf -y clean all

WORKDIR "/"

ADD prometheus-node-exporter.spec /root/rpmbuild/SPECS/prometheus-node-exporter.spec
ADD ./prometheus* /root/rpmbuild/SOURCES/

RUN wget --quiet http://github.com/prometheus/node_exporter/releases/download/v1.9.1/node_exporter-1.9.1.linux-amd64.tar.gz -O /root/rpmbuild/SOURCES/prometheus-node-exporter-1.9.1.tar.gz 

RUN rpmbuild -ba /root/rpmbuild/SPECS/prometheus-node-exporter.spec

