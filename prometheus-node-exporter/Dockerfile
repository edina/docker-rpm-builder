FROM rockylinux:9

ARG NODE_EXPORTER_VER=1.9.1

RUN dnf update -y && dnf -y clean all
RUN dnf install -y systemd-rpm-macros wget rpmdevtools && dnf -y clean all

WORKDIR "/"

ADD prometheus-node-exporter.spec /root/rpmbuild/SPECS/prometheus-node-exporter.spec
ADD ./prometheus* /root/rpmbuild/SOURCES/

RUN wget --quiet http://github.com/prometheus/node_exporter/releases/download/v$NODE_EXPORTER_VER/node_exporter-$NODE_EXPORTER_VER.linux-amd64.tar.gz -O /root/rpmbuild/SOURCES/prometheus-node-exporter-$NODE_EXPORTER_VER.tar.gz 

RUN rpmbuild -ba /root/rpmbuild/SPECS/prometheus-node-exporter.spec

