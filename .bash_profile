#!/bin/bash

parse_git_branch() {
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ ! "${BRANCH}" == "" ]
  then
    STAT=`parse_git_dirty`
    echo "[${BRANCH}${STAT}]"
  else
    echo ""
  fi
}

show_background_color() {
# show list of supported background color
  for C in {0..255}; do
      tput setab $C
      echo -n "$C "
  done
  tput sgr0
  echo
}

show_foreground_color() {
  # show list of supported foreground color
  for C in {0..255}; do
      tput setaf $C
      echo -n "$C "
  done
  tput sgr0
  echo
}

debian_chroot=${debian_chroot:+($debian_chroot)}
color_green="\[$(tput setaf 2)\]"
color_grey="\[$(tput setaf 8)\]"
color_yellow="\[$(tput setaf 3)\]"
color_reset="\[$(tput sgr0)\]"
esc=$(printf "\e")
export PS1="$color_grey${debian_chroot}\u@\h${color_reset}\n"
export PS1=${PS1}"${color_green}\w${color_yellow}\$(parse_git_branch)${color_reset}\n"
export PS1=${PS1}"$ "

#
# Environments senttings
#
source ~/.bashrc.env
