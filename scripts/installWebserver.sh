#!/bin/bash

# Parameters
NAME=$1;

# Change prompts
echo 'export PS1="[\[\e[32m\]\u\[\e[39m\]@\[\e[32m\]\h \[\e[34m\]\W\[\e[39m\]]$ "' >> /home/centos/.bashrc
echo 'export PS1="[\[\e[31m\]\u\[\e[39m\]@\[\e[31m\]\h \[\e[34m\]\W\[\e[39m\]]$ "' >> /root/.bashrc

# Update
yum update -y
# Install httpd
yum install -y httpd php

# Git clone the repo
git clone ~/azure-centos-webserver
# Move site files to web dir
mv ~/azure-centos-webserver/site-files/* /var/www/html/
# Write name to file
echo -e "$NAME" > /var/www/html/name.txt

# Start service
systemctl restart httpd && systemctl enable httpd
