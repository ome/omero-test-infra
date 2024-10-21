#!/bin/bash

# Stop the script if any step fails
set -e

# Fetch Miniconda
wget --no-check-certificate https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh

# Install Miniconda
[ -d "$HOME/miniconda" ] || bash miniconda.sh -b -p $HOME/miniconda

# Add Miniconda to PATH
export PATH="$HOME/miniconda/bin:$PATH"

# Initialize conda for shell interaction
source "$HOME/miniconda/bin/activate"

# Update conda and configure to use conda-forge channel by default
conda update -y conda
conda config --add channels conda-forge
conda config --set channel_priority strict

# Install Python 3.9.15 in the base environment
conda install -y python=3.9.15

# Install omero-py
conda install -y omero-py
conda install -y rdflib

echo "omero-py and rdflib installed successfully"
