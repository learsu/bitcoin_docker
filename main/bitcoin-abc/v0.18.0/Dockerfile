#
# Dockerfile
#
# @author learsu
# @since 2017-11-24
#
#
FROM phusion/baseimage:0.10.2
MAINTAINER learsu

ENV HOME /root
ENV TERM xterm
CMD ["/sbin/my_init"]

# use aliyun source
#ADD sources-aliyun.com.list /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3
RUN apt-get install -y libboost-all-dev libzmq3-dev curl wget net-tools

RUN mkdir ~/source
RUN cd ~/source && wget https://github.com/Bitcoin-ABC/bitcoin-abc/archive/v0.17.1.tar.gz
RUN cd ~/source \
  && tar zxf v0.17.1.tar.gz && cd bitcoin-abc-0.17.1 \
  && ./autogen.sh \
  && ./configure --disable-wallet --disable-tests \
  && make -j$(nproc) && make install

# mkdir bitcoind data dir
RUN mkdir -p /root/.bitcoin
RUN mkdir -p /root/.bitcoin/log
RUN mkdir -p /root/scripts

# scripts
ADD monitor-bitcoind.sh   /root/scripts/monitor-bitcoind.sh
ADD logrotate.sh   /root/scripts/logrotate.sh
RUN chmod +x /root/scripts/monitor-bitcoind.sh
RUN chmod +x /root/scripts/logrotate.sh

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