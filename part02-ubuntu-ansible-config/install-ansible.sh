#!/bin/bash

set -e

echo "-----------------Install ansible config-----------------"
sleep 30
sudo apt-get update
sudo apt-get install htop nmon mc -y

echo "-----------------Adding ansible repository-----------------"
sudo apt-get install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible

echo "-----------------Install ansible-----------------"
sudo apt-get -y install ansible && ansible --version

echo "---------------------------------------------------"