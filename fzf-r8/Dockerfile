FROM --platform=linux/amd64 rockylinux:8 as builder

RUN dnf install -y wget git make

RUN wget https://dl.google.com/go/go1.21.3.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.21.3.linux-amd64.tar.gz

ENV PATH=$PATH:/usr/local/go/bin
ENV GOROOT=/usr/local/go
ENV GOPATH=$HOME/Documents/go

RUN git clone --depth 1 -b 0.52.1 https://github.com/junegunn/fzf.git /app/fzf
WORKDIR /app/fzf

RUN make
RUN make install

FROM --platform=linux/amd64 rockylinux:9

RUN dnf install -y wget rubygems ruby-devel gcc gcc-c++ tar rpm-build make
RUN mkdir /app
ADD Gemfile /app/Gemfile
WORKDIR /app
RUN bundle install

ADD fpm.sh /root/fpm.sh
RUN mkdir -p /tmp/usr/local/bin/
COPY --from=builder /app/fzf/bin/fzf /tmp/usr/local/bin/

WORKDIR "/root"
RUN /root/fpm.sh
