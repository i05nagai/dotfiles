#!/bin/bash


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


# misc
sudo apt-get install -y \
  vim-gnome \
  tmux \
  zsh

#
# install
#
git submodule init
git submodule update
vim -N -u NONE -i NONE -V1 -e -s --cmd "source .vimrc" --cmd NeoBundleInstall! --cmd qall!
# change shell
chsh -s /bin/zsh
