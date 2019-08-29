#!/bin/bash

apt-get update -y

sudo apt-get install unattended-upgrades

sudo dpkg-reconfigure -plow unattended-upgrades

echo "tmpfs /run/shm tmpfsro,noexec,nosuid 0 0" >> /etc/fstab

apt-get install -y nginx > /home/ubuntu/nginx_install.log

mkdir /etc/nginx/ssl

openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=GB/ST=West Sussex/L=Horsham/O=IS/CN=localhost" -keyout /etc/nginx/ssl/server.key  -out /etc/nginx/ssl/server.cert

echo "server {
    listen              443 ssl;
    server_name         localhost;
    ssl_certificate     /etc/nginx/ssl/server.cert;
    ssl_certificate_key /etc/nginx/ssl/server.key;
    ssl_protocols       TLSv1 TLSv1.1 TLSv1.2;
    ssl_ciphers         HIGH:!aNULL:!MD5;

    root /var/www/html;
    index index.html;

    location /hello/ {
        default_type text/plain;
        return 200 'world';
    }

}" > /etc/nginx/sites-enabled/hello

systemctl restart nginx


