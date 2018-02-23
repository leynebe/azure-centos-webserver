#!/bin/bash

NAME=$1;

# Update
yum update -y
# Install httpd
yum install -y httpd

# Create index.html
echo -e "<h1>Hello_$NAME!</h1>" > /var/www/html/index.html

# Start service
systemctl start httpd && systemctl enable httpd
