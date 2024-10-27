# Use a base image with Micromamba
FROM mambaorg/micromamba:latest as mamba_base

# Create a new environment and install any required dependencies (example shown with Python)
RUN micromamba create -y -n ontop python=3.9 omero-py rdflib requests pytest

# Set PATH to include Micromamba environment binaries
ENV PATH=/opt/conda/envs/ontop/bin:$PATH

# Switch to the Ontop base image and copy Micromamba setup from the base
FROM ontop/ontop

# Copy the environment from mamba_base to the final image
COPY --from=mamba_base /opt/conda /opt/conda

# Set PATH to include the copied Micromamba environment
ENV PATH="/opt/conda/envs/ontop/bin:$PATH"

# Set working directory inside the container
WORKDIR /opt/ontop

USER root

# Sets ENV PATH for miniconda
ENV PATH="/root/miniconda/bin:$PATH"

# Copy scripts into the container
# COPY test_infra_ontop /usr/local/bin/ontop-config I think this line is wrong
COPY test_infra_ontop /opt/ontop/input/

# Makes scripts executable
RUN chmod +x /opt/ontop/input/*


RUN /opt/ontop/input/insert_data.sh

# Download the PostgreSQL JDBC driver and place it in the jdbc directory
RUN wget --no-check-certificate https://jdbc.postgresql.org/download/postgresql-42.7.4.jar -P /opt/ontop/jdbc/

# Expose the necessary port for Ontop
EXPOSE 8080

# Ensure the properties file uses PostgreSQL connection settings
RUN sed -i 's|jdbc.url=.*|jdbc.url=jdbc:postgresql://db:5432/postgres|' /opt/ontop/input/omemap.properties && \
    sed -i 's|jdbc.user=.*|jdbc.user=postgres|' /opt/ontop/input/omemap.properties && \
    sed -i 's|jdbc.password=.*|jdbc.password=postgres|' /opt/ontop/input/omemap.properties && \
    sed -i 's|jdbc.driver=.*|jdbc.driver=org.postgresql.Driver|' /opt/ontop/input/omemap.properties

# Set entrypoint to run the Ontop endpoint
ENTRYPOINT java -cp ./lib/*:./jdbc/* -Dlogback.configurationFile=file:./log/logback.xml \
    it.unibz.inf.ontop.cli.Ontop endpoint \
    --ontology=/opt/ontop/input/omemap.ttl \
    --mapping=/opt/ontop/input/omemap.obda \
    --properties=/opt/ontop/input/omemap.properties \
    --xml-catalog=/opt/ontop/input/catalog-v001.xml \
    --cors-allowed-origins=http://yasgui.org \
    --lazy
