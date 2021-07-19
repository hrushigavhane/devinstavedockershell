#!/bin/bash



mkdir /root/biz
cd /root/biz
apt-get install curl
curl https://raw.githubusercontent.com/WhatsApp/WhatsApp-Business-API-Setup-Scripts/master/installation/docker-compose.yml > docker-compose.yml
curl https://raw.githubusercontent.com/WhatsApp/WhatsApp-Business-API-Setup-Scripts/master/installation/db.env > db.env
export WA_API_VERSION=2.35.5

apt-get remove docker docker-engine docker.io containerd runc -y
apt-get update -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable" -y
apt-get update -y
apt-get install docker-ce docker-ce-cli containerd.io -y
apt-cache madison docker-ce
docker run hello-world

rm /usr/local/bin/docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose --version

docker-compose up -d
docker-compose ps
export WA_API_VERSION=2.35.5


