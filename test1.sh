#!/bin/bash
yum install -y wget
yum install -y jq
yum install -y expect
wget https://github.com/ethersphere/bee-clef/releases/download/v0.4.9/bee-clef_0.4.9_amd64.rpm
sudo rpm -i bee-clef_0.4.9_amd64.rpm
wget https://github.com/ethersphere/bee/releases/download/v0.5.3/bee_0.5.3_amd64.rpm
sudo rpm -i bee_0.5.3_amd64.rpm
sed -i 's/# swap-enable: true/swap-enable: true/g' /etc/bee/bee.yaml
sed -i 's#rpc.slock.it/goerli#goerli.infura.io/v3/1a52eb27a260489da846cbb904bf0a23#g' /etc/bee/bee.yaml
sudo chown -R bee:bee /var/lib/bee
systemctl restart bee
wget -O cashout.sh https://gist.githubusercontent.com/ralph-pichler/3b5ccd7a5c5cd0500e6428752b37e975/raw/b40510f1172b96c21d6d20558ca1e70d26d625c4/cashout.sh && chmod +x cashout.sh
(echo "00 02 * * * /root/cashout.sh cashout-all";  crontab -l ) | crontab
