#!/bin/bash
apt-get update
sleep 30
apt-get install apt-transport-https
sleep 30
apt-get install gnupg
sleep 30
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.2.list
chmod +775 /etc/apt/sources.list.d/mongodb-org-4.2.list
apt-get update
sleep 30
apt-get install -y mongodb-org
sleep 30
systemctl start mongod
systemctl enable mongod
