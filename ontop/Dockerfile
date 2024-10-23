# Use the Ontop image as the base
FROM ontop/ontop

# Set working directory inside the container
WORKDIR /opt/ontop

USER root

# Sets ENV PATH for miniconda
ENV PATH="/root/miniconda/bin:$PATH"

# Copy scripts into the container
COPY install_omero_py.sh /usr/local/bin/install_omero_py.sh
COPY test_infra_ontop/insert_data.sh /usr/local/bin/insert_data.sh
COPY test_infra_ontop /usr/local/bin/ontop-config
COPY test_infra_ontop/test_endpoint.py /usr/local/bin/ontop-config/tests

# Makes scripts executable
RUN chmod +x /usr/local/bin/install_omero_py.sh 
RUN chmod +x /usr/local/bin/insert_data.sh
RUN chmod +x /usr/local/bin/tests

# Run scripts
RUN /usr/local/bin/install_omero_py.sh
RUN /usr/local/bin/insert_data.sh

# Copy property files from your local directory to the container
COPY test_infra_ontop/omemap.obda test_infra_ontop/omemap.properties test_infra/omemap.ttl test_infra/catalog-v001.xml /opt/ontop/input/

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
