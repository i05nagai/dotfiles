#!/bin/bash

# brew install tmux-mem-cpu-load
brew install pass
brew install vim --with-lua --with-gettext --with-override-system-vi
brew install zplug
brew install fzf
brew install go
brew install zsh
brew install hub

brew cask install docker
brew cask install slack
brew cask install dropbox
brew cask install grammarly
brew cask install google-chrome
brew cask install mendeley
brew cask install google-japanese-ime

# terrafrom
# java
# hub
# scala
# gcloud

#
# Ricty
#
brew tap sanemat/font
brew install ricty --with-powerline
cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf
