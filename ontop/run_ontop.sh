#!/bin/bash
set -e

OWL_FILE=/usr/local/ontop/mpieb/omemap.ttl
OBDA_FILE=/usr/local/ontop/mpieb/omemap.obda
PROPERTIES_FILE=/usr/local/ontop/mpieb/omemap.properties
ONTOP_CLI_DIR=/usr/local/ontop/ontop-cli

echo "Launching Ontop..."
exec $ONTOP_CLI_DIR/ontop endpoint --ontology=$OWL_FILE --mapping=$OBDA_FILE --properties=$PROPERTIES_FILE
