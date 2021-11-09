#!/bin/bash

#export GOOGLE_APPLICATION_CREDENTIALS="/x/y"

./mvnw clean install -DskipTests

if [[ $1 == cloud ]]
then
  ./mvnw spring-boot:run -DskipTests \
         -Dspring-boot.run.jvmArguments="-Dspring.profiles.active=cloud" \
         -Dspring.cloud.gcp.credentials.location="file:///$HOME/service-account.json"
else
  ./mvnw spring-boot:run -DskipTests
fi

