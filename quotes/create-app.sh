#!/bin/sh

oc new-app --template common/php-mysql-ephemeral \
  -p NAME=quotesapi \
  -p APPLICATION_DOMAIN=quote.apps.lab.example.com \
  -p SOURCE_REPOSITORY_URL=http://services.lab.example.com/quotes \
  -p DATABASE_SERVICE_NAME=quotesdb \
  -p DATABASE_USER=user1 \
  -p DATABASE_PASSWORD=mypa55 \
  --name quotes
