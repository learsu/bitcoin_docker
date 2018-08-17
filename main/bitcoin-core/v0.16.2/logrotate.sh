#! /bin/bash

sleep 10
cp /root/.bitcoin/log/btc.log /root/.bitcoin/log/$(date -d "yesterday" +"%Y%m%d").log
echo "" > /root/.bitcoin/log/btc.log