#!/bin/bash


WHO=$(whoami)

# install npm v4
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
nvm install v4

# install ZeroMQ libraries
sudo apt-get -y install libzmq3-dev

# install bitcore (branched and patched from https://github.com/str4d/zcash)
npm install str4d/bitcore-node-zcash

# install mongodb
sudo apt-get install mongodb

# install Node.js MongoDB driver
sudo apt-get install libkrb5-dev

# create bitcore node
./node_modules/bitcore-node-zcash/bin/bitcore-node create zclassic-wallet-service
cd zclassic-wallet-service

# install patched insight-api-zclassic and bitcore wallet-service
../node_modules/bitcore-node-zcash/bin/bitcore-node install bitpay/bitcore-wallet-service johandjoz/insight-api-zclassic

# create bitcore config file for bitcore and zcashd/zclassicd
cat << EOF > bitcore-node.json
{
  "network": "livenet",
  "port": 3001,
  "servicesConfig": {
    "bitcore-wallet-service": {
      "bwsPort": 3232
    },
    "bitcoind": {
        "datadir": "./data",
        "exec": "$HOME/zclassic-addressindexing/src/zcashd"
    }
  },
  "services": [
    "bitcoind",
    "bitcore-wallet-service",
    "insight-api",
    "web"
  ]
}
EOF

# create zcash.conf
cat << EOF > data/zcash.conf
server=1
whitelist=127.0.0.1
txindex=1
addressindex=1
timestampindex=1
spentindex=1
zmqpubrawtx=tcp://127.0.0.1:8332
zmqpubhashblock=tcp://127.0.0.1:8332
rpcallowip=127.0.0.1
rpcuser=bitcoin
rpcpassword=local321
uacomment=bitcore
showmetrics=0
maxconnections=1000
addnode=149.56.129.104
addnode=51.254.132.145
addnode=139.99.100.70
EOF

echo "Start the wallet service"
echo "nvm use v4; ./node_modules/bitcore-node-zcash/bin/bitcore-node start"
