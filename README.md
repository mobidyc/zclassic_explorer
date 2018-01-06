# zclassic_explorer

Getting Started
```
./zclassic_explorer_1.sh
```
logout (you need to relogin to get bash variables for NVM)
```
./zclassic_explorer_2.sh
```
open http://server_ip/insight/ in browser

for bitcore-wallet-service
```
apt-get install mongodb
apt-get install libkrb5-dev
git clone https://github.com/bitpay/bitcore-wallet-service.git
cd bitcore-wallet-service && npm install
```
BWS needs mongoDB. You can configure the connection and other parameters at config.js
```
npm start
```
The wallet service should be running as a service within Bitcore. You may point wallets on the same network to:

http://your-bitcore-node-ip:3232/bws/api

