
awscli-completion()
{
  set -x
  if which aws_completer >/dev/null 2>&1; then
    local DIR=$(which aws_completer | xargs dirname)
    if [[ -e ${DIR}/aws_zsh_completer.sh ]]; then
      source ${DIR}/aws_zsh_completer.sh
    fi
  fi
}
