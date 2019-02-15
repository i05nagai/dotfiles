# comment out if you want to profile zsh
# zmodload zsh/zprof && zprof

# export LANG=ja_JP.UTF-8
# export LANG_ALL=ja_JP.UTF-8
export LANG=en_US.UTF-8
export LANG_ALL=en_US.UTF-8
export TERM=xterm-256color

# autoload
autoload -Uz compinit
autoload -Uz colors
autoload history-search-end

#
# vcs info
#
# Use built-in vcs_info function which retrive VCS information
autoload -Uz vcs_info
# vcs's settings
# display format
# %b: branch information
# %a: action (e.g. merge/rebase)
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'

# options
setopt auto_resume
setopt no_beep
setopt no_clobber
setopt no_hup
setopt no_multios
setopt magic_equal_subst
setopt notify
setopt numeric_glob_sort
setopt print_eight_bit

# Completion
#di: directory
#ln: symbolic link
#so: socket file
#pi: FIFO file
#ex: execution file
#bd: block special file
#cd: character special file
#su: execution file with setuid
#sg: execution file with setgid
#tw: スティッキビットありother書き込み権限つきディレクトリ
#ow: スティッキビットなしother書き込み権限つきディレクトリ
#00: do nothing
#01: bold
#04: underline
#05: blink
#07: invert foreground color
#08: not displayed
#22: ノーマル化
#24: no underline
#25: no blink
#27: disable inverting foreground color
#30: black foreground color
#31: red foreground color
#32: green foreground color
#33: brown foreground color
#34: blue foreground color
#35: magenta foreground color
#36: cyan foreground color
#37: white foreground color
#39: default foreground color
#40: black background color
#41: red background color
#42: green background color
#43: brown background color
#44: blue background color
#45: magenta background color
#46: cyan background color
#47: white background color
#49: default background color
zstyle ':completion:*' list-colors 'di=01;34' 'ln=01;36' 'so=01;41;37' 'ex=01;32' 'su=41;30' 'sg=41;30' 'bd=01;46;34' 'cd=01;43;34'
# not to change the position of prompt while completing
setopt always_last_prompt
# whent the completion is ambigious you get a list without having to type ^D
setopt auto_list
# If auto_param_slash is set, any parameter expressions whose value is the name of a directory will have a slash
setopt auto_param_slash
# Delete '/' by pressing space
setopt auto_remove_slash
# you only get the menu when you hit TAB again on the ambiguous completion
setopt auto_menu
#
setopt auto_param_keys
# command correct edition before each completion attempt
setopt correct
# expand glob when you execute a command
setopt extended_glob
# compacked complete list display
setopt list_packed
# list completions horizontally
setopt list_rows_first
# discriptive completion ls -F
# /: dir
# @: symbolic linkc
setopt list_types
#
setopt mark_dirs
#
setopt no_menu_complete

# Directory
setopt auto_cd
# auto directory pushd that you can get dirs list by cd -[tab]
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_to_home

# History
# Command history configuration
HISTFILE=~/.shell/log/zsh_history
HISTSIZE=10000
SAVEHIST=10000
# ignore duplication command history list
setopt hist_ignore_all_dups
setopt hist_no_store
setopt hist_reduce_blanks
setopt share_history

# Editor
export EDITOR="vim"
# history file for less
export LESSHISTFILE=-

#
# Environments senttings
#
source ~/.zshrc.env
source ~/.shell/zsh/zshrc.bindkey
source ~/.shell/zsh/zshrc.alias
source ~/.shell/zsh/zshrc.prompt
source ~/.shell/zsh/zshrc.hook

if [ ! -d $HOME/.vimbackup ]; then
  mkdir $HOME/.vimbackup
fi

# profiling. see line 1
if (which zprof > /dev/null 2>&1) ;then
  zprof
fi
