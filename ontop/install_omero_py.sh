#!/bin/bash

# Stop the script if any step fails
set -e

# Install package for unzipping Micromamba
sudo apt-get update && sudo apt-get install -y bzip2

# Fetch Micromamba
wget --no-check-certificate https://micro.mamba.pm/api/micromamba/linux-64/latest -O micromamba.tar.bz2

# Extract Micromamba
tar -xvjf micromamba.tar.bz2 -C $HOME

# Add Micromamba to PATH
export PATH="$HOME/bin:$PATH"

# Create the base environment with Micromamba
micromamba create -y -p $HOME/micromamba-env python=3.9.15

# Activate the base environment
source $HOME/micromamba-env/bin/activate

# Configure to use conda-forge channel by default
micromamba config --add channels conda-forge
micromamba config --set channel_priority strict

# Install omero-py
micromamba install -y -n base omero-py rdflib requests pytest

echo "omero-py, rdflib, pytest and requests installed successfully"
