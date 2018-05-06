#!/bin/bash

# create docker as root privilege
sudo groupadd docker
# add current user to docker group
sudo usermod -aG docker $USER

echo "logout and login"
