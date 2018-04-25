# 
# get functions of which name starts with 'fzf_?_print_'
#
fzf_p() {
  VALUE=`$(print -l ${(ok)functions} | grep "fzf_.*print_" | fzf)`
  LBUFFER+=${VALUE}
}

#
# get functions of which name starts with 'fzf_?_run_'
#
fzf_r() {
  $(print -l ${(ok)functions} | grep "fzf_.*run_" | fzf)
}

################################################################################
# Shell builtin
################################################################################
fzf_select_history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}

fzf_run_bindkey() {
  BUFFER=$(bindkey | fzf --query "$LBUFFER" --prompt="Bindkey > ")
}
