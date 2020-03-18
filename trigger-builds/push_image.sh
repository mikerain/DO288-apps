#!/bin/bash

cd ~/DO288/labs/trigger-builds
docker load -i php-70-rhel7-newer.tar.gz
docker tag \
    registry.lab.example.com:5000/rhscl/php-70-rhel7:7.0-5.14 \
    registry.lab.example.com:5000/rhscl/php-70-rhel7:latest
docker push \
    registry.lab.example.com:5000/rhscl/php-70-rhel7:latest