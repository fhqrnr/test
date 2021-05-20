dir=/home/

wget https://gethstore.blob.core.windows.net/builds/geth-linux-amd64-1.10.3-991384a7.tar.gz -O - | tar zxvf - -C $dir
mv ${dir}geth-linux-amd64-1.10.3-991384a7 ${dir}geth
nohup ${dir}geth/geth --datadir /data --goerli --rpc --rpcaddr=0.0.0.0 --rpcapi eth,net,web3,personal,admin,txpool console >> ${dir}geth.log 2>&1
