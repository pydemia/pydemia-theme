#!/bin/bash

RCFILE=~/.bashrc
curl -fsSLO https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
  bash ./Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/conda && \
  $HOME/conda/bin/conda init  && \
  echo 'export CONDA_PATH="$HOME/conda"' >> $RCFILE && \
  source $RCFILE
