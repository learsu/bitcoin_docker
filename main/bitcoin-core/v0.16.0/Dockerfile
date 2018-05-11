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
RUN cd ~/source && wget https://github.com/bitcoin/bitcoin/archive/v0.16.0.tar.gz
RUN cd ~/source \
  && tar zxf v0.16.0.tar.gz && cd bitcoin-0.16.0 \
  && ./autogen.sh \
  && ./configure --disable-wallet --disable-tests \
  && make -j$(nproc) && make install

# mkdir bitcoind data dir
RUN mkdir -p /root/.bitcoin

# logrotate
ADD logrotate-bitcoind /etc/logrotate.d/bitcoind

#
# services
#
# service for mainnet
RUN mkdir    /etc/service/bitcoind
ADD run      /etc/service/bitcoind/run
RUN chmod +x /etc/service/bitcoind/run

# remove source & build files
RUN rm -rf ~/source

# clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*