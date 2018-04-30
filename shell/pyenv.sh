#!/bin/sh

# pyenv (must be executed after modifying PATH environment variable)
if [[ -e ~/.pyenv ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  # command exists
  if which pyenv virtualenv-init >/dev/null 2>&1; then
    eval "$(pyenv virtualenv-init -)"
  fi
fi
