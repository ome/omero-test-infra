#!/bin/bash
set -e

OWL_FILE=/usr/local/bin/ontop-config/omemap.ttl
OBDA_FILE=/usr/local/bin/ontop-config/omemap.obda
PROPERTIES_FILE=/usr/local/bin/ontop-config/omemap.properties

echo "==============================================================="
echo "Checking whether Java and Postgres are running and operational"
echo "Whats in the port where sql should be?"
apt update && apt install -y net-tools
netstat -tuln | grep -q ":5432"
# Check if Java is running
if pgrep -x "java" > /dev/null
then
    echo "Java is running"
else
    echo "Java is not running"
fi

# Check if Postgres is running
if pgrep -x "postgres" > /dev/null
then
    echo "Postgres is running"
else
    echo "Postgres is not running"
fi
echo "==============================================================="

echo "Launching Ontop..."
exec ontop-cli/ontop endpoint --ontology=$OWL_FILE --mapping=$OBDA_FILE --properties=$PROPERTIES_FILE
