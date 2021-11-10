#!/bin/bash

export PROJECT_ID=$(gcloud config list --format 'value(core.project)')
export GOOGLE_APPLICATION_CREDENTIALS=$HOME/service-account.json

./mvnw clean install -DskipTests

if [[ $1 == cloud ]]
then
  cd ./gcp-spring-guestbook-api && \
  ./mvnw spring-boot:run -DskipTests \
         -Dspring-boot.run.jvmArguments="-Dspring.profiles.active=cloud" 
        #  -Dspring.cloud.gcp.credentials.location="file:///$HOME/service-account.json"
# else
#   cd ./gcp-spring-guestbook-api && \
#   ./mvnw spring-boot:run -DskipTests
fi

#curl -XPOST -H "content-type: application/json"   -d '{"name": "Ray", "message": "Hello CloudSQL"}'   http://localhost:8081/guestbookMessages
#curl http://localhost:8081/guestbookMessages

# gcloud container clusters create guestbook-cluster \
#     --zone=europe-west1-b \
#     --num-nodes=2 \
#     --machine-type=n1-standard-2 \
#     --enable-autorepair \
#     --enable-stackdriver-kubernetes


# kubectl create secret generic guestbook-service-account \
#   --from-file=$HOME/service-account.json
# kubectl describe secret guestbook-service-account