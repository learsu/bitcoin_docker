#
# Dockerfile
#
# @author learsu
# @since 2017-11-24
#
#
FROM phusion/baseimage:0.9.22
MAINTAINER learsu

ENV HOME /root
ENV TERM xterm
CMD ["/sbin/my_init"]

# use aliyun source
#ADD sources-aliyun.com.list /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3
RUN apt-get install -y libboost-all-dev libzmq3-dev curl wget net-tools

# build bitcoind
RUN mkdir ~/source
RUN cd ~/source && wget https://github.com/bitcoin/bitcoin/archive/v0.15.1.tar.gz
RUN cd ~/source \
  && tar zxf v0.15.1.tar.gz && cd bitcoin-0.15.1 \
  && ./autogen.sh \
  && ./configure --disable-wallet \
  && make -j$(nproc) && make install

# mkdir bitcoind data dir
RUN mkdir -p /root/.bitcoin

# logrotate
ADD logrotate-bitcoind /etc/logrotate.d/bitcoind

#
# services
#
# service for testnet3
RUN mkdir        /etc/service/bitcoind_testnet3
ADD run_testnet3 /etc/service/bitcoind_testnet3/run
RUN chmod +x     /etc/service/bitcoind_testnet3/run

# remove source & build files
RUN rm -rf ~/source

# clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
