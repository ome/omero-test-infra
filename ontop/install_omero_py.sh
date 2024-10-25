#!/bin/bash

# Stop the script if any step fails
set -e

# Install Micromamba using the installation script
curl -Ls https://micro.mamba.pm/install.sh | bash

# Add Micromamba to PATH
export PATH="$HOME/micromamba/bin:$PATH"

# Initialize Micromamba shell
eval "$(micromamba shell hook -s bash)"

# Create the base environment with Micromamba
micromamba create -y -n base python=3.9.15

# Activate the base environment
micromamba activate base

# Configure to use conda-forge channel by default
micromamba config set channels conda-forge
micromamba config set channel_priority strict

# Install omero-py and other packages
micromamba install -y omero-py rdflib requests pytest

echo "omero-py, rdflib, pytest and requests installed successfully"
