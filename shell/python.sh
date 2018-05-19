#!/bin/bash

if which python > /dev/null 2>&1; then
  python_paths()
  {
    python -c "import sys; print('\n'.join(sys.path))"
  }
fi
