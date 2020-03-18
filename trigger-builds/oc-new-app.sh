#!/bin/bash

oc new-app --name trigger \
    php~http://services.lab.example.com/trigger-builds