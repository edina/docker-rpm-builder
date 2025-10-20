FROM rockylinux:8

RUN yum update -y && yum -y clean all
RUN yum install -y curl gcc gcc-c++ tar rpm-build make

ENV NVIM_VERSION=0.11.4

WORKDIR "/"

ADD neovim.spec /root/rpmbuild/SPECS/neovim.spec
RUN mkdir -p /root/rpmbuild/SOURCES 
RUN curl -L "https://github.com/neovim/neovim-releases/releases/download/v${NVIM_VERSION}/nvim-linux-x86_64.tar.gz" > /root/rpmbuild/SOURCES/neovim-${NVIM_VERSION}.tar.gz

RUN rpmbuild -ba /root/rpmbuild/SPECS/neovim.spec
