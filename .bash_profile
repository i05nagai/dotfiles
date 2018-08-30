#!/bin/bash

set -e

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\e[90;5;198m${debian_chroot:+($debian_chroot)}\u@\h\n"
export PS1=${PS1}"\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\n"
export PS1=${PS1}"$ "

#
# Environments senttings
#
source ~/.bashrc.env
