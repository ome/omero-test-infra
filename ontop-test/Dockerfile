FROM mambaorg/micromamba:2.0.2

# Set working directory inside the container
WORKDIR /opt/project

# Ensure PATH includes micromamba
ENV PATH="/opt/conda/bin:$PATH"

# Install necessary packages
RUN micromamba install -y -n base -c conda-forge python=3.9.15 omero-py rdflib requests pytest && micromamba clean -a -y

RUN echo "omero-py, rdflib, pytest, and requests installed successfully"

# Switch to root for file operations
USER root

# Copy the necessary scripts into the container
COPY test_infra_ontop/insert_data.sh /opt/project/insert_data.sh
COPY test_infra_ontop/test_endpoint.py /opt/project/test_endpoint.py

# Set executable permissions
RUN chmod +x /opt/project/insert_data.sh /opt/project/test_endpoint.py

# Create a writable temp directory for OMERO and set permissions
ENV OMERO_TEMPDIR=/opt/project/tmp
RUN mkdir -p $OMERO_TEMPDIR && chown -R 1000:1000 /opt/project

# Switch to non-root user for running the scripts
USER 1000

# Run the scripts in the specified order
RUN /opt/project/insert_data.sh && python /opt/project/test_endpoint.py


# Run the scripts in the specified order
RUN python /opt/project/test_endpoint.py

# Print a confirmation message after successful execution
RUN echo "Tests ran successfully."


# I think this nobody user is interacting with everything else