#!/bin/bash

#export GOOGLE_APPLICATION_CREDENTIALS="/x/y"

./mvnw clean install -DskipTests

if [[ $1 == cloud ]]
then
  ./mvnw spring-boot:run -DskipTests -Dspring-boot.run.jvmArguments="-Dspring.profiles.active=cloud"
else
  ./mvnw spring-boot:run -DskipTests
fi

#curl -XPOST -H "content-type: application/json"   -d '{"name": "Ray", "message": "Hello CloudSQL"}'   http://localhost:8081/guestbookMessages
#curl http://localhost:8081/guestbookMessages
