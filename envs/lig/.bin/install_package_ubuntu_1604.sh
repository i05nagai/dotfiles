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
  curl \
  zsh

# zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

# prasmussen/gdrive 
curl -o $HOME/.bin/gdrive -L 'https://docs.google.com/uc?id=0B3X9GlR6EmbnQ0FtZmJJUXEyRTA&export=download'
chmod 755 $HOME/.bin/gdrive

# pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# openssh
mkdir -p /tmp/openssh
cd /tmp/openssh
wget --no-check-certificate https://launchpadlibrarian.net/335526589/openssh-client_7.5p1-10_amd64.deb
wget --no-check-certificate https://launchpadlibrarian.net/298453050/libgssapi-krb5-2_1.14.3+dfsg-2ubuntu1_amd64.deb
wget --no-check-certificate https://launchpadlibrarian.net/298453058/libkrb5-3_1.14.3+dfsg-2ubuntu1_amd64.deb
wget --no-check-certificate https://launchpadlibrarian.net/298453060/libkrb5support0_1.14.3+dfsg-2ubuntu1_amd64.deb
sudo dpkg -i libkrb5support0_1.14.3+dfsg-2ubuntu1_amd64.deb
sudo dpkg -i libkrb5-3_1.14.3+dfsg-2ubuntu1_amd64.deb
sudo dpkg -i libgssapi-krb5-2_1.14.3+dfsg-2ubuntu1_amd64.deb
sudo dpkg -i openssh-client_7.5p1-10_amd64.deb
ssh -V

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
~/.rbenv/bin/rbenv init


#
# install
#
git submodule init
git submodule update
vim -N -u NONE -i NONE -V1 -e -s --cmd "source .vimrc" --cmd NeoBundleInstall! --cmd qall!
# change shell
chsh -s /bin/zsh
