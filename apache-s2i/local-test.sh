#!/bin/sh

docker run --name test -u 1234 \
    -p 8080:8080 -d s2i-sample-app
