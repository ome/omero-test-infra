#!/bin/bash
set -e

OWL_FILE=/usr/local/bin/ontop-config/omemap.ttl
OBDA_FILE=/usr/local/bin/ontop-config/omemap.obda
PROPERTIES_FILE=/usr/local/bin/ontop-config/omemap.properties

echo "Launching Ontop..."
echo "====================================================="
ls /usr/local/bin/
echo "====================================================="
ls /usr/local/
echo "====================================================="
exec /usr/local/bin/ontop endpoint --ontology=$OWL_FILE --mapping=$OBDA_FILE --properties=$PROPERTIES_FILE
