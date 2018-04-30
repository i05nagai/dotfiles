#!/bin/sh

if which go > /dev/null 2>&1; then
  export GOPATH="${HOME}/programming/go"
  export PATH="${GOPATH}/bin:$PATH"
fi
