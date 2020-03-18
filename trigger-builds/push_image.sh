#!/bin/bash

#cd ~/DO288/labs/trigger-builds
cd /root/DO288-apps/trigger-builds
docker load -i /docker-images/php-70-rhel7-newer.tar.gz
docker tag \
    registry.access.redhat.com/rhscl/php-70-rhel7:7.0-5.14 \
    docker-registry-default.apps.os311.test.it.example.com:5000/rhscl/php-70-rhel7:latest
docker push \
    docker-registry-default.apps.os311.test.it.example.com:5000/rhscl/php-70-rhel7:latest