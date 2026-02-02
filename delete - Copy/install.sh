#!/bin/bash
apt update -y
apt install apache2 awscli -y
systemctl start apache2
systemctl enable apache2

aws s3 cp s3://my-s3-cit-24-01-0396/index.html /var/www/html/index.html
