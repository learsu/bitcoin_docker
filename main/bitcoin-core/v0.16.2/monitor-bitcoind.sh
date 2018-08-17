#! /bin/bash
#
# bitcoind monitor shell
#
SROOT=$(cd $(dirname "$0"); pwd)
cd $SROOT

BITCOIND_RPC="bitcoin-cli "

LOG=/root/.bitcoin/log/btc.log

HEIGHT=`$BITCOIND_RPC getblockchaininfo | grep "blocks" | awk '{print $2}' | awk -F"," '{print $1}'`
CONNS=`$BITCOIND_RPC getnetworkinfo | grep "connections" | awk '{print $2}' | awk -F"," '{print $1}'`
DATE=`date "+%Y-%m-%d %H:%M:%S"`

echo "$DATE | height:$HEIGHT | conn:$CONNS;" >> $LOG