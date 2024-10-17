#!/bin/bash
# set -e

OWL_FILE=/usr/local/bin/ontop-config/omemap.ttl
OBDA_FILE=/usr/local/bin/ontop-config/omemap.obda
PROPERTIES_FILE=/usr/local/bin/ontop-config/omemap.properties

echo "🌸🌸🌸🌸🌸🌸🌸"
echo "testing connection with db"
apt-get update && apt-get install -y iputils-ping
ping db
echo "🌸🌸🌸🌸🌸🌸🌸"

echo "💥💥💥💥💥💥"
echo "where am I"
ls
pwd
echo "💥💥💥💥💥💥"
echo "ok now an LS to make sure my paths for files are A-Okay"
ls /usr/local/bin/ontop-config
echo "💥💥💥💥💥💥"

echo "Launching Ontop..."
exec ontop-cli/ontop endpoint --ontology=$OWL_FILE --mapping=$OBDA_FILE --properties=$PROPERTIES_FILE

