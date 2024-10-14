#!/bin/bash
set -e

OWL_FILE=/usr/local/bin/ontop-config/omemap.ttl
OBDA_FILE=/usr/local/bin/ontop-config/omemap.obda
PROPERTIES_FILE=/usr/local/bin/ontop-config/omemap.properties

echo "Launching Ontop..."
exec /usr/local/bin/ontop-config endpoint --ontology=$OWL_FILE --mapping=$OBDA_FILE --properties=$PROPERTIES_FILE
