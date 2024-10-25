#!/bin/bash

# Stop the script if any step fails
set -e

# Create a directory for Micromamba
mkdir -p $HOME/micromamba/bin

# Download Micromamba static binary
wget --no-check-certificate https://micro.mamba.pm/api/micromamba/linux-64/latest -O $HOME/micromamba/bin/micromamba

# Make it executable
chmod +x $HOME/micromamba/bin/micromamba

# Add Micromamba to PATH
export PATH="$HOME/micromamba/bin:$PATH"

# Initialize Micromamba shell
eval "$($HOME/micromamba/bin/micromamba shell hook -s bash)"

# Create the base environment with Micromamba
micromamba create -y -p $HOME/micromamba/envs/base python=3.9.15

# Activate the base environment
micromamba activate $HOME/micromamba/envs/base

# Configure to use conda-forge channel by default
micromamba config set channels conda-forge
micromamba config set channel_priority strict

# Install omero-py and other packages
micromamba install -y omero-py rdflib requests pytest

echo "omero-py, rdflib, pytest and requests installed successfully"
