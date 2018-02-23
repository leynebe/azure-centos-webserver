#!/bin/bash

# Parameters
NAME=$1;

# Change prompts
echo 'export PS1="[\[\e[32m\]\u\[\e[39m\]@\[\e[32m\]\h \[\e[34m\]\W\[\e[39m\]]$ "' >> /home/centos/.bashrc
echo 'export PS1="[\[\e[31m\]\u\[\e[39m\]@\[\e[31m\]\h \[\e[34m\]\W\[\e[39m\]]$ "' >> /root/.bashrc

# Update
yum update -y
# Install httpd
yum install -y httpd

# Create index.html
echo -e "<h1>Hello_$NAME!</h1>" > /var/www/html/index.html

# Start service
systemctl start httpd && systemctl enable httpd
