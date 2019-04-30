#!/bin/bash

#install xrdp in AZURE

sudo apt-get update -y
sudo apt-get install xfce4 -y
sudo apt-get install xrdp -y
sudo systemctl enable xrdp
echo xfce4-session >~/.xsession
sudo service xrdp restart

# install dependencies
sudo apt update
sudo apt-get -y install redis-server
sudo systemctl enable redis-server
sudo systemctl start redis-server

echo 'spinnaker.s3.versioning: false' > ~/.hal/default/profiles/front50-local.yml
