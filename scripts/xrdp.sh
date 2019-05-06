#!/bin/bash

#install xrdp in AZURE

sudo apt-get update -y
sudo apt-get install xfce4 -y
sudo apt-get install xrdp -y
sudo systemctl enable xrdp
echo xfce4-session >~/.xsession
sudo service xrdp restart

