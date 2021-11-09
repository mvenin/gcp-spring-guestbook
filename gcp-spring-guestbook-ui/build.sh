#!/bin/bash

#export PROJECT_ID=$(gcloud config list --format 'value(core.project)')
#export GOOGLE_APPLICATION_CREDENTIALS=$HOME/service-account.json

./mvnw clean install -DskipTests

if [[ $1 == cloud ]]
then
  ./mvnw spring-boot:run -DskipTests \
         -Dspring-boot.run.jvmArguments="-Dspring.profiles.active=cloud"
        #  -Dspring.cloud.gcp.credentials.location="file:///$HOME/service-account.json"
else
  ./mvnw spring-boot:run -DskipTests
fi

