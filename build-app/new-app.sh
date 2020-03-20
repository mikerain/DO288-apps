#!/bin/bash

oc new-app --name simple \
    --build-env npm_config_registry=\
http://invalid-server:8081/nexus/content/groups/nodejs \
    http://services.lab.example.com/build-app
