#!/bin/bash

# command exists
if which gtags >/dev/null 2>&1; then
  alias gtags-pygments='gtags --gtagslabel=pygments'
fi
