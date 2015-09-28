#!/usr/bin/env bash 

source ./helper-scripts.conf

EXTENSION='.tar.gz'
PDF_VALIDATOR_VERSIO='4.5.RC1'
TOMCAT_FILENAME=apache-tomcat-${TOMCAT_VERSION}
TOMCAT_URL=http://www.eu.apache.org/dist/tomcat/tomcat-7/v${TOMCAT_VERSION}/bin/${TOMCAT_FILENAME}${EXTENSION}

# Clean before download 
echo 'Cleaning up tomcats'
rm -fr ${TOMCAT_FILENAME}* 

echo 'Downloding new version of Tomcat'
http $TOMCAT_URL > $TOMCAT_FILENAME${EXTENSION}
tar xf ${TOMCAT_FILENAME}${EXTENSION} 

rm -fr ${TOMCAT_FILENAME}${EXTENSION}

echo 'Creating directories for tomcat configuration'
mkdir -p ${TOMCAT_FILENAME}/conf/Catalina/localhost

WEBAPP_PATH=$PWD/pdf-validator-parent/pdf-validator-webapp/target/pdf-validator-webapp-${PDF_VALIDATOR_VERSIO}
match='{webapp_path}'

