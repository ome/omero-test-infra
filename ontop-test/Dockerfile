FROM mambaorg/micromamba:2.0.2

# Set working directory inside the container
WORKDIR /opt/project

# Ensure PATH includes micromamba
ENV PATH="/opt/conda/bin:$PATH"

# Install dependencies
RUN micromamba install -y -n base -c conda-forge python=3.9.15 omero-py rdflib requests pytest && micromamba clean -a -y
RUN echo "omero-py, rdflib, pytest, and requests installed successfully"

USER root

# Copy the necessary scripts into the container
COPY test_infra_ontop/insert_data.sh /opt/project/insert_data.sh
COPY test_infra_ontop/test_endpoint.py /opt/project/test_endpoint.py
COPY test_infra_ontop/entrypoint.sh /opt/project/entrypoint.sh

# Set executable permissions
RUN chmod +x /opt/project/insert_data.sh /opt/project/test_endpoint.py /opt/project/entrypoint.sh

# Switch back to mambauser
USER mambauser

# Set entrypoint to run the scripts at container startup
ENTRYPOINT ["/opt/project/entrypoint.sh"]
