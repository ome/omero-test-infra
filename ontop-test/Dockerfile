FROM mambaorg/micromamba:2.0.2

RUN echo '🦋🦋🦋🦋🦋🦋🦋🦋🦋'
RUN echo id
RUN echo whoami
RUN echo '🦋🦋🦋🦋🦋🦋🦋🦋🦋'

# Set working directory inside the container
WORKDIR /opt/project

# Ensure PATH includes micromamba
ENV PATH="/opt/conda/bin:$PATH"

RUN micromamba install -y -n base -c conda-forge python=3.9.15 omero-py rdflib requests pytest && micromamba clean -a -y

RUN echo "omero-py, rdflib, pytest, and requests installed successfully"

USER root

# Copy the necessary scripts into the container
COPY test_infra_ontop/insert_data.sh /opt/project/insert_data.sh
COPY test_infra_ontop/test_endpoint.py /opt/project/test_endpoint.py

# Set executable permissions
RUN chmod +x /opt/project/insert_data.sh /opt/project/test_endpoint.py

# TODO: try with omero-server user
# USER omero-server
#35 0.299 FATAL: Running /opt/conda/bin/omero as root can corrupt your directory permissions.
#35 ERROR: process "/usr/local/bin/_dockerfile_shell.sh /opt/project/insert_data.sh && python /opt/project/test_endpoint.py" did not complete successfully: exit code: 1

#21 [omero 1/2] FROM docker.io/openmicroscopy/omero-server:5@sha256:527a2330fefbce4728e0b0d4a7b35b3c4862ba3c6433321b81683c5121753d4c
#21 CANCELED

#36 [web 2/2] RUN dnf install -y -q     java-11-openjdk     git &&     dnf clean all
#36 CANCELED

# Run the scripts in the specified order
RUN /opt/project/insert_data.sh && python /opt/project/test_endpoint.py

# Print a confirmation message after successful execution
RUN echo "Tests ran successfully."
