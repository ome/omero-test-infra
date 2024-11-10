#!/bin/bash
set -e

echo "Waiting for OMERO service to be available..."

# Loop until the OMERO service is reachable
until curl -f http://omero:4064; do
    echo "OMERO service is not ready. Retrying in 5 seconds..."
    sleep 5
done

echo "OMERO service is available. Running scripts..."

# Run the scripts
/opt/project/insert_data.sh && python /opt/project/test_endpoint.py
