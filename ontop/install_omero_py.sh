#!/bin/bash

# Stop the script if any step fails
set -e

# Fetch Miniconda
wget --no-check-certificate https://repo.anaconda.com/miniconda/Miniconda3-py39_4.10.3-Linux-x86_64.sh -O miniconda.sh

# Install Miniconda
[ -d "$HOME/miniconda" ] || bash miniconda.sh -b -p $HOME/miniconda

# Add Miniconda to PATH
export PATH="$HOME/miniconda/bin:$PATH"

# Initialize conda for shell interaction
source "$HOME/miniconda/bin/activate"

# Install depenendcies
conda install -c conda-forge -y mamba
mamba install -c conda-forge -y python=3.9.15
mamba install -c conda-forge  -y omero-py rdflib requests pytest

echo "omero-py, rdflib, pytest and requests installed successfully"
