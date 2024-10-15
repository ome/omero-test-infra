#!/bin/sh

INSTALL_DIR="ontop-cli"
ZIP_FILE="ontop-cli-5.2.0.zip"
JDBC_DRIVER="postgresql-42.7.4.jar"

# Check whether Ontop CLI is already installed
if [ ! -d "$INSTALL_DIR" ]; then
    echo "Ontop CLI is not installed. Installing Ontop CLI..."
    wget https://github.com/ontop/ontop/releases/download/ontop-5.2.0/$ZIP_FILE
    mkdir -p $INSTALL_DIR
    unzip $ZIP_FILE -d $INSTALL_DIR
    rm $ZIP_FILE

    # Download JDBC driver for PostgreSQL
    wget https://jdbc.postgresql.org/download/$JDBC_DRIVER -P $INSTALL_DIR/jdbc
else
    echo "Ontop CLI is already installed."
fi


apt update && apt install -y lsof
echo "==============================================================="
echo "Checking whether Java and Postgres are running and operational"
# Check if Java is running
lsof -i -P -n
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


echo "Ontop installation completed."