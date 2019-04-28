#!/bin/bash

brew install zsh
brew install tmux
brew install git
# brew install tmux-mem-cpu-load
brew install pass
brew install vim --with-lua --with-gettext --with-override-system-vi
brew install zplug
brew install fzf
brew install go
brew install hub
brew install pwgen
brew install bazel
brew install cmake

# chunkwm
brew tap koekeishiya/formulae
brew install chunkwm
brew services start chunkwm
# skhd
brew install skhd
brew services start skhd

brew cask install anaconda
brew cask install iterm2
brew cask install karabiner-elements
brew cask install java
brew cask install docker
brew cask install slack
brew cask install skype
brew cask install dropbox
brew cask install grammarly
brew cask install google-chrome
brew cask install mendeley
brew cask install google-japanese-ime
brew cask install skitch
brew cask install intellij-idea-ce

# terrafrom
# scala
# gcloud

# miniconda2
# curl -O -L https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
curl -L -O https://repo.anaconda.com/miniconda/Miniconda2-latest-MacOSX-x86_64.sh
bash Miniconda2-latest-MacOSX-x86_64.sh -b

#
# Ricty
#
brew tap sanemat/font
brew install ricty --with-powerline
cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf
curl https://repo.continuum.io/archive/Anaconda2-5.1.0-MacOSX-x86_64.sh -o anaconda2.sh
