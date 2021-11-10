#!/bin/bash

export PROJECT_ID=$(gcloud config list --format 'value(core.project)')
export GOOGLE_APPLICATION_CREDENTIALS=$HOME/service-account.json
alias g=gcloud

./mvnw clean install -DskipTests

if [[ $1 == cloud ]]
then
  ./mvnw spring-boot:run -DskipTests \
         -Dspring-boot.run.jvmArguments="-Dspring.profiles.active=cloud"
        #  -Dspring.cloud.gcp.credentials.location="file:///$HOME/service-account.json"
# else
#   ./mvnw spring-boot:run -DskipTests
fi

# ./mvnw package appengine:deploy -DskipTests
# gcloud app logs tail -s default
# gcloud app browse