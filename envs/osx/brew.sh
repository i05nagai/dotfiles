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

brew install --cask miniconda
brew install --cask iterm2
brew install --cask karabiner-elements
brew install --cask java
brew install --cask docker
brew install --cask slack
brew install --cask skype
brew install --cask dropbox
brew install --cask grammarly
brew install --cask google-chrome
brew install --cask mendeley
brew install --cask google-japanese-ime
brew install --cask skitch
brew install --cask visual-studio-code
brew install --cask intellij-idea-ce

# terrafrom
# scala
# gcloud

#
# Ricty
#
brew tap sanemat/font
brew install ricty --with-powerline
cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf
curl https://repo.continuum.io/archive/Anaconda2-5.1.0-MacOSX-x86_64.sh -o anaconda2.sh
