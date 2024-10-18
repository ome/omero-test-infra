# Use the Ontop image as the base
FROM ontop/ontop

# Set working directory inside the container
WORKDIR /opt/ontop

USER root

# # Installs dependencies
# RUN apt-get update && apt-get install -y \
#     default-jdk \
#     wget \
#     unzip \
#     && rm -rf /var/lib/apt/lists/*

# Sets ENV PATH for miniconda
ENV PATH="/root/miniconda/bin:$PATH"

# Copy scripts into the container
COPY install_omero_py.sh /usr/local/bin/install_omero_py.sh
# COPY install_ontop.sh /usr/local/bin/install_ontop.sh
# COPY run_ontop.sh /usr/local/bin/run_ontop.sh
COPY mpieb /usr/local/bin/ontop-config

# Makes scripts executable
RUN chmod +x /usr/local/bin/install_omero_py.sh 
# /usr/local/bin/install_ontop.sh /usr/local/bin/run_ontop.sh


# Run scripts
RUN /usr/local/bin/install_omero_py.sh
# RUN /usr/local/bin/install_ontop.sh
# RUN /usr/local/bin/run_ontop.sh


# Copy the OBDA, properties, and TTL files from your local directory to the container
COPY mpieb/omemap.obda mpieb/omemap.properties mpieb/omemap.ttl /opt/ontop/input/

# Download the PostgreSQL JDBC driver and place it in the jdbc directory
RUN wget https://jdbc.postgresql.org/download/postgresql-42.7.4.jar -P /opt/ontop/jdbc/

# Expose the necessary port for Ontop
EXPOSE 8080

# Ensure the properties file uses PostgreSQL connection settings
RUN sed -i 's|jdbc.url=.*|jdbc.url=jdbc:postgresql://db:5432/postgres|' /opt/ontop/input/omemap.properties && \
    sed -i 's|jdbc.user=.*|jdbc.user=postgres|' /opt/ontop/input/omemap.properties && \
    sed -i 's|jdbc.password=.*|jdbc.password=postgres|' /opt/ontop/input/omemap.properties && \
    sed -i 's|jdbc.driver=.*|jdbc.driver=org.postgresql.Driver|' /opt/ontop/input/omemap.properties

# Set entrypoint to run the Ontop endpoint using the provided files
ENTRYPOINT java -cp ./lib/*:./jdbc/* -Dlogback.configurationFile=file:./log/logback.xml \
    it.unibz.inf.ontop.cli.Ontop endpoint \
    --ontology=/opt/ontop/input/omemap.ttl \
    --mapping=/opt/ontop/input/omemap.obda \
    --properties=/opt/ontop/input/omemap.properties \
    --cors-allowed-origins=http://yasgui.org \
    --lazy
