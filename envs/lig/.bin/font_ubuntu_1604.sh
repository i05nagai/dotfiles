#!/bin/bash

#
# Ricty
#
install_ricty() {
  sudo apt-get install fontforge
  mkdir -p ~/.local/share/fonts
  TMPDIR=$(mktemp -d /tmp/ricty-XXXXX)
  pushd $TMPDIR
  # miku
  wget http://iij.dl.sourceforge.jp/mix-mplus-ipa/59022/migu-1m-20130617.zip
  unzip migu-1m-*.zip
  cp migu-1m-*/*.ttf .
  # incosolat
  wget https://github.com/google/fonts/raw/master/ofl/inconsolata/Inconsolata-Regular.ttf
  wget https://github.com/google/fonts/raw/master/ofl/inconsolata/Inconsolata-Bold.ttf
  # ricty
  wget http://www.rs.tus.ac.jp/yyusa/ricty/ricty_generator.sh
  bash ricty_generator.sh Inconsolata-{Regular,Bold}.ttf migu-1m-{regular,bold}.ttf

  # Ricty for powerline
  git clone https://github.com/powerline/fontpatcher.git
  fontforge -script fontpatcher/scripts/powerline-fontpatcher Ricty-Regular.ttf
  fontforge -script fontpatcher/scripts/powerline-fontpatcher Ricty-Bold.ttf

  cp *.ttf ~/.local/share/fonts/
  popd
  rm -rf $TMPDIR

  fc-cache -f -v
  fc-list | grep Ricty
}
