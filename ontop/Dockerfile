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

# Copy scripts into the container
COPY install_omero_py.sh /usr/local/bin/install_omero_py.sh
COPY install_ontop.sh /usr/local/bin/install_ontop.sh
COPY run_ontop.sh /usr/local/bin/run_ontop.sh
COPY mpieb /usr/local/bin/ontop-config

# Makes scripts executable
RUN chmod +x /usr/local/bin/install_omero_py.sh /usr/local/bin/install_ontop.sh /usr/local/bin/run_ontop.sh

# Run scripts
RUN /usr/local/bin/install_omero_py.sh
RUN /usr/local/bin/install_ontop.sh
RUN /usr/local/bin/run_ontop.sh
