#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
apt update
apt upgrade -y
apt install -y nginx
mkdir -p /data/nginx/cache
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget https://raw.githubusercontent.com/kevincloud/terraform-aws-nginx/master/scripts/content_server
sed -i -e 's/{HOSTNAME}/${web_server_address}/g' ./content_server
cp ./content_server /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/content_server /etc/nginx/sites-enabled/content_server
systemctl restart nginx
