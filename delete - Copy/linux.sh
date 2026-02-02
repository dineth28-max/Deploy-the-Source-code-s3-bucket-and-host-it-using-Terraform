#!/bin/bash
yum update -y
yum install httpd awscli -y
systemctl start httpd
systemctl enable httpd

aws s3 cp s3://my-s3-cit-24-01-0396/index.html /var/www/html/index.html
