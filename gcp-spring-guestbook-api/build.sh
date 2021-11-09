#!/bin/bash

export PROJECT_ID=$(gcloud config list --format 'value(core.project)')
export GOOGLE_APPLICATION_CREDENTIALS=$HOME/service-account.json

./mvnw clean install -DskipTests

if [[ $1 == cloud ]]
then
#   cd ./gcp-spring-guestbook-api && \
  ./mvnw spring-boot:run -DskipTests \
         -Dspring-boot.run.jvmArguments="-Dspring.profiles.active=cloud"
        #  -Dspring.cloud.gcp.credentials.location="file:///$HOME/service-account.json"
# else
#   ./mvnw spring-boot:run -DskipTests
fi

#curl -XPOST -H "content-type: application/json"   -d '{"name": "Ray", "message": "Hello CloudSQL"}'   http://localhost:8081/guestbookMessages
#curl http://localhost:8081/guestbookMessages
