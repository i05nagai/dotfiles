#!/bin/bash

#
# for ubuntu 16.04
#

#
# Install packages
#

# git
sudo add-apt-repostory ppa:git-core/ppa
sudo apt-get update
sudo apt-get install -y git

# chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update
sudo apt-get install -y google-chrome-stable

# vim
sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get update
sudo apt-get install vim-gnome=2:8.0.1752-0york1~16.04

# misc
sudo apt-get install -y \
  tmux \
  i3 \
  zsh

#
# install
#
git submodule init
git submodule update
vim -N -u NONE -i NONE -V1 -e -s --cmd "source .vimrc" --cmd NeoBundleInstall! --cmd qall!
# change shell
chsh -s /bin/zsh
