#!/bin/bash

# Stop the script if any step fails
set -e

apt-get update
apt-get install -y curl tar xz-utils bzip2

# Create a directory for Micromamba binaries
mkdir -p ~/micromamba/bin

# Install Micromamba using the installation script
echo 'curl 🐌🐌🐌'
curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj -C ~/micromamba/bin bin/micromamba

# Add Micromamba to PATH
export PATH="$HOME/micromamba/bin:$PATH"

# Set the root prefix to a different directory
export MAMBA_ROOT_PREFIX="$HOME/mamba-root"

# Initialize Micromamba shell with the new root prefix
eval "$(micromamba shell hook -s posix)"
micromamba shell init -s bash -p "$MAMBA_ROOT_PREFIX"

# Create and activate the base environment
micromamba create -y -n base python=3.9.15

# Activate the base environment (in non-interactive mode)
micromamba activate base

# Configure to use conda-forge channel by default
micromamba config append channels conda-forge
micromamba config set channel_priority strict

# Install omero-py and other packages
micromamba install -y omero-py rdflib requests pytest

echo "omero-py, rdflib, pytest, and requests installed successfully"
