#!/bin/bash
set -e
sudo yum install unzip
sudo yum install wget
wget https://github.com/tkuchiki/alp/releases/download/v0.3.1/alp_linux_amd64.zip
unzip alp_linux_amd64.zip
sudo mv alp /usr/local/bin/alp
sudo chown {user名} /usr/local/bin/alp
