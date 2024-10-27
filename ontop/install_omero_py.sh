#!/bin/bash

# Stop the script if any step fails
set -e

apt-get update
apt-get install -y curl tar xz-utils bzip2

# Create a directory for Micromamba
mkdir -p ~/micromamba

# Install Micromamba using the installation script via wget
echo 'curl 🐌🐌🐌'
curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba
ls

# Add Micromamba to PATH
export PATH="$HOME/micromamba/bin:$PATH"

# Initialize Micromamba shell
eval "$(./bin/micromamba bash hook -s posix)"
./bin/micromamba bash init -s bash -r ~/micromamba
source ~/.bashrc

micromamba activate

# Create the base environment with Micromamba
micromamba create -y -n base python=3.9.15

# Configure to use conda-forge channel by default
micromamba config append channels conda-forge
micromamba config set channel_priority strict

# Install omero-py and other packages
micromamba install -y omero-py rdflib requests pytest

echo "omero-py, rdflib, pytest, and requests installed successfully"
