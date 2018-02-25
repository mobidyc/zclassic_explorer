# zclassic_explorer

Getting Started - Tested on Ubuntu and Debian (server) - zclassicexplorer.com

```
git clone https://github.com/johandjoz/zclassic_explorer
cd zclassic_explorer
```

```
./zclassic_explorer_1.sh
```

logout (you need to relogin to get bash variables for NVM)

```
./zclassic_explorer_2.sh
```

Before start you need to change for the new Zclassic RPC port (8023) in :
/zclassic-explorer/node_modules/bitcore-node-zcash/lib/services/bitcoind.js ligne 491

open http://server_ip/insight/ in browser
