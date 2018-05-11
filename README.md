Docker for bitcoin core/abc fullnode
============================

* OS: `Ubuntu 16.04 LTS`
* Docker Image OS: `Ubuntu 16.04 LTS`

### Bitcoin Core
* Bitcoin Core 0.15.1

### Bitcoin ABC
* Bitcoin ABC v0.16.1
* Bitcoin ABC v0.16.2

## Install Docker
```
#root权限登陆安装Docker
#国外服务器
#wget -qO- https://get.docker.com/ | sh
#国内服务器
curl -sSL https://get.daocloud.io/docker | sh

service docker start
service docker status

#Docker 加速器 仅限国内服务器 可直接在https://www.daocloud.io申请自己的账户替换自己的地址
curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://33a88d17.m.daocloud.io
service docker restart

docker ps -a -q | xargs docker stop
docker ps -a -q | xargs docker start
docker ps -a -q | xargs docker restart
docker ps -a -q | xargs docker rm
```

## mainnet
```
mkdir -p /work
cd /work
git clone https://github.com/learsu/bitcoin_docker.git
cd bitcoin_docker/
```

### Build bitcoin cash mainnet Docker Images

```
# build Bitcoin ABC v0.16.1
cd /work/bitcoin_docker/main/bitcoin-abc/v0.16.1
docker build -t bitcoin-abc:0.16.1 .
# docker build --no-cache -t bitcoin-abc:0.16.1 .

# build Bitcoin ABC v0.16.2
cd /work/bitcoin_docker/main/bitcoin-abc/v0.16.2
docker build -t bitcoin-abc:0.16.2 .
# docker build --no-cache -t bitcoin-abc:0.16.2 .

# build Bitcoin ABC v0.17.1
cd /work/bitcoin_docker/main/bitcoin-abc/v0.17.1
docker build -t bitcoin-abc:0.17.1 .
# docker build --no-cache -t bitcoin-abc:0.17.1 .

mkdir -p /work/bitcoin-abc
cp ./bitcoin.conf /work/bitcoin-abc/bitcoin.conf

```

### Start Docker Container
```
# start Bitcoin ABC v0.16.1
docker run -it -v /work/bitcoin-abc:/root/.bitcoin --name bitcoin-abc -p 9333:8333 -p 9332:8332 -p 9331:8331 --restart always -d bitcoin-abc:0.16.1

# start Bitcoin ABC v0.16.2
docker run -it -v /work/bitcoin-abc:/root/.bitcoin --name bitcoin-abc -p 9333:8333 -p 9332:8332 -p 9331:8331 --restart always -d bitcoin-abc:0.16.2

# start Bitcoin ABC v0.17.1
docker run -it -v /work/bitcoin-abc:/root/.bitcoin --name bitcoin-abc -p 9333:8333 -p 9332:8332 -p 9331:8331 --restart always -d bitcoin-abc:0.17.1

# login
docker exec -it bitcoin-abc /bin/bash
```


### Build bitcoin core mainnet Docker Images
```
# build Bitcoin core v0.15.1
cd /work/bitcoin_docker/main/bitcoin-core/v0.15.1
docker build -t bitcoind:0.15.1 .
# docker build --no-cache -t bitcoind:0.15.1 .

# build Bitcoin core v0.16.0
cd /work/bitcoin_docker/main/bitcoin-core/v0.16.0
docker build -t bitcoind:0.16.0 .
# docker build --no-cache -t bitcoind:0.16.0 .

mkdir -p /work/bitcoind
cp ./bitcoin.conf /work/bitcoind/bitcoin.conf
```

### Start Docker Container
```
# start Bitcoin core v0.15.1
docker run -it -v /work/bitcoind:/root/.bitcoin --name bitcoind -p 8333:8333 -p 8332:8332 -p 8331:8331 --restart always -d bitcoind:0.15.1

# start Bitcoin core v0.16.0
docker run -it -v /work/bitcoind:/root/.bitcoin --name bitcoind -p 8333:8333 -p 8332:8332 -p 8331:8331 --restart always -d bitcoind:0.16.0

# login
docker exec -it bitcoind /bin/bash
```

## testnet
```
mkdir -p /work
cd /work
git clone https://github.com/learsu/bitcoin_docker.git
cd bitcoin_docker/
```

### Build bitcoin cash testnet Docker Images

```
# build Bitcoin ABC v0.16.1
cd /work/bitcoin_docker/testnet/bitcoin-abc/v0.16.1
docker build -t bitcoin-abc-testnet:0.16.1 .
# docker build --no-cache -t bitcoin-abc-testnet:0.16.1 .

# build Bitcoin ABC v0.16.2
cd /work/bitcoin_docker/testnet/bitcoin-abc/v0.16.2
docker build -t bitcoin-abc-testnet:0.16.2 .
# docker build --no-cache -t bitcoin-abc-testnet:0.16.2 .

# build Bitcoin ABC v0.17.1
cd /work/bitcoin_docker/testnet/bitcoin-abc/v0.17.1
docker build -t bitcoin-abc-testnet:0.17.1 .
# docker build --no-cache -t bitcoin-abc-testnet:0.17.1 .

mkdir -p /work/bitcoin-abc
cp ./bitcoin.conf /work/bitcoin-abc/bitcoin.conf
```

### Start Docker Container
```
# start Bitcoin ABC v0.16.1
docker run -it -v /work/bitcoin-abc:/root/.bitcoin --name bitcoin-abc-testnet -p 19333:18333 -p 19332:18332 -p 19331:18331 --restart always -d bitcoin-abc-testnet:0.16.1

# start Bitcoin ABC v0.16.2
docker run -it -v /work/bitcoin-abc:/root/.bitcoin --name bitcoin-abc-testnet -p 19333:18333 -p 19332:18332 -p 19331:18331 --restart always -d bitcoin-abc-testnet:0.16.2

# start Bitcoin ABC v0.17.1
docker run -it -v /work/bitcoin-abc:/root/.bitcoin --name bitcoin-abc-testnet -p 19333:18333 -p 19332:18332 -p 19331:18331 --restart always -d bitcoin-abc-testnet:0.17.1

# login
docker exec -it bitcoin-abc /bin/bash
```


### Build bitcoin core testnet Docker Images
```
# build Bitcoin core v0.15.1
cd /work/bitcoin_docker/testnet/bitcoin-core/v0.15.1
docker build -t bitcoind-testnet:0.15.1 .
# docker build --no-cache -t bitcoind-testnet:0.15.1 .

# build Bitcoin core v0.16.0
cd /work/bitcoin_docker/testnet/bitcoin-core/v0.16.0
docker build -t bitcoind-testnet:0.16.0 .
# docker build --no-cache -t bitcoind-testnet:0.16.0 .

mkdir -p /work/bitcoind
cp ./bitcoin.conf /work/bitcoind/bitcoin.conf
```

### Start Docker Container
```
# start Bitcoin core v0.15.1
docker run -it -v /work/bitcoind:/root/.bitcoin --name bitcoind-testnet -p 18333:18333 -p 18332:18332 -p 18331:18331 --restart always -d bitcoind-testnet:0.15.1

# start Bitcoin core v0.16.0
docker run -it -v /work/bitcoind:/root/.bitcoin --name bitcoind-testnet -p 18333:18333 -p 18332:18332 -p 18331:18331 --restart always -d bitcoind-testnet:0.16.0

# login
docker exec -it bitcoind /bin/bash
```

## About config
```
#根据CPU个数配置
rpcthreads=4
#根据内存配置
dbcache=1000
```

### Bitcoin Core 0.15.1 
```
rpcuser=bitcoin
rpcpassword=123456
rpcthreads=4
dbcache=1000

#main
rpc port 8331/8332/8333
#testnet
rpc port 18331/18332/18333
```

### Bitcoin ABC v0.16.1
```
rpcuser=bitcoin
rpcpassword=123456
rpcthreads=4
dbcache=1000

#main
rpc port 9331/9332/9333
#testnet
rpc port 19331/19332/19333
```
