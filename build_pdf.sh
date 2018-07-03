#!/bin/bash
# This runs in Travis to build my resume. You can run this locally.

# Needed to check if conda already installed
export PATH="$HOME/miniconda/bin:$PATH"

# If not yet installed, obtain Miniconda
# and tectonic
# From tectonic docs
# https://tectonic-typesetting.github.io/en-US/install.html#the-anaconda-method
if ! command -v conda > /dev/null; then # Install conda if you don't have it.
  wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh;
  bash miniconda.sh -b -p $HOME/miniconda -u;
  conda config --add channels conda-forge;
  conda config --set always_yes yes;
  conda update --all;
  conda install tectonic;
fi
tectonic cs/ethan-resume.xtx -p
