FROM debian:stretch

RUN echo "deb http://mirrors.163.com/debian/ stretch main\n \
deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib\n \
deb-src http://mirrors.163.com/debian/ stretch-updates main non-free contrib\n \
deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib\n \
deb http://httpredir.debian.org/debian stretch-backports main contrib non-free" > /etc/apt/sources.list

ENV DEBIAN_FRONTEND noninteractive
WORKDIR /tmp

RUN apt-get update && apt-get install -y libglib2.0-dev zlib1g-dev libpcre3-dev libssl-dev git cmake build-essential wget lsb-release

RUN echo "mysql-apt-config mysql-apt-config/select-server select mysql-5.7" | /usr/bin/debconf-set-selections
RUN wget https://repo.mysql.com/mysql-apt-config_0.8.13-1_all.deb && \
    dpkg -i mysql-apt-config_0.8.13-1_all.deb && \
    apt-get update && \
    apt-get install -y libmysqlclient-dev

RUN git clone https://github.com/pingcap/mydumper.git && \
    cd mydumper && \
    git checkout dynamic-build && \
    cmake . && \
    make
