#!/bin/bash

oc new-app --name todo --file ~/todo-template.yaml \
    -p NPM_PROXY=http://services.lab.example.com:8081/nexus/content/groups/nodejs \
    -p PASSWORD=mypass \
    -p CLEAN_DATABASE=false \
    # ADD MISSING PARAMETERS AND CHANGE PARAMETER VALUES IF NEEDED
