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
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

# pip
pushd /tmp
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py install "pip==9.0.3"
popd

# powerline
pip install --user powerline-status

# openssh
mkdir -p /tmp/openssh
pushd /tmp/openssh
wget --no-check-certificate https://launchpadlibrarian.net/335526589/openssh-client_7.5p1-10_amd64.deb
wget --no-check-certificate https://launchpadlibrarian.net/298453050/libgssapi-krb5-2_1.14.3+dfsg-2ubuntu1_amd64.deb
wget --no-check-certificate https://launchpadlibrarian.net/298453058/libkrb5-3_1.14.3+dfsg-2ubuntu1_amd64.deb
wget --no-check-certificate https://launchpadlibrarian.net/298453060/libkrb5support0_1.14.3+dfsg-2ubuntu1_amd64.deb
sudo dpkg -i libkrb5support0_1.14.3+dfsg-2ubuntu1_amd64.deb
sudo dpkg -i libkrb5-3_1.14.3+dfsg-2ubuntu1_amd64.deb
sudo dpkg -i libgssapi-krb5-2_1.14.3+dfsg-2ubuntu1_amd64.deb
sudo dpkg -i openssh-client_7.5p1-10_amd64.deb
ssh -V
popd

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
~/.rbenv/bin/rbenv init
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# mendely desktop
curl -L https://www.mendeley.com/repositories/ubuntu/stable/amd64/mendeleydesktop-latest -o mendeleydesktop.deb
sudo dpkg -i mendeleydesktop-latest.deb

# golang
sudo apt-get install golang-1.10
go get -u github.com/golang/dep/cmd/dep

#
# install
#
git submodule init
git submodule update
vim -N -u NONE -i NONE -V1 -e -s --cmd "source .vimrc" --cmd NeoBundleInstall! --cmd qall!
# change shell
chsh -s /bin/zsh

#
# install hub
#
curl -L -O https://github.com/github/hub/releases/download/v2.4.0/hub-linux-amd64-2.4.0.tgz
mv hub-linux-amd64-2.4.0.tgz /tmp
cd /tmp
tar xfv /tmp/hub-linux-amd64-2.4.0.tgz
cp hub-linux-amd64-2.4.0/bin/hub  ~/.bin

#
# java
#
sudo apt-get install default-jdk
