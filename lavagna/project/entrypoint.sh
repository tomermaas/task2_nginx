#!/bin/bash

# Default environment variables
DB_DIALECT=${DB_DIALECT:-HSQLDB}
DB_URL=${DB_URL:-jdbc:hsqldb:file:/app/data/lavagna;shutdown=true}
DB_USERNAME=${DB_USERNAME:-sa}
DB_PASSWORD=${DB_PASSWORD:-}
SPRING_PROFILE=${SPRING_PROFILE:-dev}

# Run the application
exec java \
  -Ddatasource.dialect=$DB_DIALECT \
  -Ddatasource.url=$DB_URL \
  -Ddatasource.username=$DB_USERNAME \
  -Ddatasource.password=$DB_PASSWORD \
  -Dspring.profiles.active=$SPRING_PROFILE \
  -jar lavagna-jetty-console.war
