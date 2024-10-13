FROM ubuntu:latest

USER root

# Installs dependencies
RUN apt-get update && apt-get install -y \
    default-jdk \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Sets ENV PATH for miniconda
ENV PATH="/root/miniconda/bin:$PATH"

# Makes scripts executable
RUN chmod +x ./install_omero_py.sh ./install_ontop.sh ./run_ontop.sh

# Run scripts
RUN ./install_omero_py.sh
RUN ./install_ontop.sh
RUN ./run_ontop.sh
