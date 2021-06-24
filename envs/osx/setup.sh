#!/bin/bash



#
# conda
#
cd /tmp
curl -L -O https://repo.continuum.io/miniconda/Miniconda2-latest-MacOSX-x86_64.sh
bash Miniconda2-latest-MacOSX-x86_64.sh -b -p $HOME/miniconda2
# conda create
conda create -n default python=3.6
# source activate default

#
# pip
#
pushd /tmp \
  && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
  && python get-pip.py \
  && popd

#
# powerline
#
pip3 install --user powerline-status
