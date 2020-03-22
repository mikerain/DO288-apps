#!/bin/bash

oc new-app --name todoapp \
    --build-env npm_config_registry=\
http://services.lab.example.com:8081/nexus/content/groups/nodejs \
    -e DATABASE_NAME=todo \
    -e DATABASE_SVC=tododb \
    -e DATABASE_USER=todoapp \
    -e DATABASE_PASSWORD=redhat \
    -e DATABASE_INIT=false \
    http://services.lab.example.com/todo-single

