#!/bin/bash

### Variables
PATTERN_LIG="^(lg|linux-gui)$"    # linux-gui
PATTERN_LIS="^l(c|inux-cui)$"     # linux-cui
PATTERN_OSX="^o(|sx)$"            # osx
PATTERN_WIN="^w(|indows)$"        # windows
#copying files
CP_GROUP=(
".zshrc"
)
#making link files
LN_GROUP=(
".ctags"
".gitconfig"
".vim"
".vimrc"
".zsh"
)

### Functions
function goto_error() {
  cat << _EOT_
Usage:
  $ ./install.sh -[Environment] [want_to_install_additionally]
Example:
  $ ./install.sh -o .xmonad
Environment:
  -c : Linux CUI
  -g : Linux GUI
  -o : OS X
  -w : Windows
_EOT_
  exit -1
}

function cp_file() {
#a: archive files.
#f: force copy by removing the destination file if needed
#v: verbose - print informative messages.
  \cp -afv `pwd`/$1 $HOME/$1
}

function ln_file() {
#f: remove existing destination files.
#s: make symbolic links instead of hard links.
#v: verbose. print name of each file before linking.
  ln -fsv `pwd`/$1 $HOME/$1
}
function ln_file_from_to() {
#f: remove existing destination files.
#s: make symbolic links instead of hard links.
#v: verbose. print name of each file before linking.
  ln -fsv `pwd`/$1 $HOME/$2
}

function ln_env_file() {
  pattern="\/\.+$"
  if [[ ! $1 =~ $pattern ]]; then
    filename=`echo $1 | awk -F'/' '{print $NF}'`
    #ln -fsv `pwd`/$1 $HOME/$filename
	ln_file $filename
  fi
}

function ln_vim_env_file() {
  #environmenmentally dependent settings.
  pattern="\/\.+$"
  if [[ ! $1 =~ $pattern ]]; then
    filename=`echo $1 | awk -F'/' '{print $NF}'`
    #ln -fsv `pwd`/$1 $HOME/.vim/$filename
	ln_file .vim/$filename
  fi
  #vim plugin settings.
  
}

function must_install() {
  echo "MUST INSTALL"
  for file in ${CP_GROUP[@]}; do cp_file $file; done
  for file in ${LN_GROUP[@]}; do ln_file $file; done
}

#install fiels for settings which dpeend on environment.
function env_install() {
  env_path="envs/$env_type/"
  case "$1" in
    "lic" )
      echo "Linux CUI"
      for file in ${env_path}.*; do ln_env_file $file; done
      ;;
    "lig" )
      echo "Linux GUI"
      for file in ${env_path}.*; do ln_env_file $file; done
      ;;
    "osx" )
      echo "OSX"
      for file in ${env_path}.*; do ln_env_file $file; done
      ;;
    "win" )
      echo "Windows"
      for file in ${env_path}.*; do ln_env_file $file; done
      ;;
    * )
      echo "Invalid env_type"
      goto_error
      ;;
  esac
}

function vim_env_install() {
  env_path="vimenvs/$env_type/"
  case "$1" in
    "lic" )
      echo "Linux CUI"
      for file in ${env_path}*; do ln_vim_env_file $file; done
      ;;
    "lig" )
      echo "Linux GUI"
      for file in ${env_path}*; do ln_vim_env_file $file; done
      ;;
    "osx" )
      echo "OSX"
      for file in ${env_path}*; do ln_vim_env_file $file; done
      ;;
    "win" )
      echo "Windows"
      for file in ${env_path}*; do ln_vim_env_file $file; done
      ;;
    * )
      echo "Invalid env_type"
      goto_error
      ;;
  esac

  #plugin settings
  if [ ! -d $HOME/.vim/plugin_settings ]; then
	mkdir $HOME/.vim/plugin_settings
  fi
  for file in vimenvs/plugin_settings/*
  do 
	  ln_file_from_to $file .vim/plugin_settings/`basename $file` 
  done
}

function add_install() {
  if [ $# -gt 0 ]; then
    echo "ADDITIONAL INSTALL"
    for file in $@; do ln_file $file ; done
  fi
}


### Main
while getopts ":cgow" opts
do
  case ${opts} in
    c ) env_type="lic" ;;
    g ) env_type="lig" ;;
    o ) env_type="osx" ;;
    w ) env_type="win" ;;
    \? ) echo "Invalid option"; goto_error ;;
  esac
done
shift `expr $OPTIND - 1`
if [ -z $env_type ]; then echo "No option error"; goto_error; fi

#the files must be installed
must_install
#the environment files.
env_install $env_type
vim_env_install $env_type
add_install $@

if [ ! -d $HOME/.vimbackup ]; then
	mkdir $HOME/.vimbackup
fi

