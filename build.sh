#!/bin/bash

./mvnw clean install -DskipTests

if [[ $1 == cloud ]]
then
  cd ./gcp-spring-guestbook-api && \
  ./mvnw spring-boot:run -DskipTests -Dspring-boot.run.jvmArguments="-Dspring.profiles.active=cloud"
else
  cd ./gcp-spring-guestbook-api && \
  ./mvnw spring-boot:run -DskipTests
fi