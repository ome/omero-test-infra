# Use the Ontop image as the base
FROM ontop/ontop

# Set working directory inside the container
WORKDIR /opt/ontop

USER root

# Copy files into the container
COPY infra_ontop /opt/ontop/input/

# Makes scripts executable
RUN chmod +x /opt/ontop/input

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
