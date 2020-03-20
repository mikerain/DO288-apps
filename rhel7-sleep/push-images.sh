#!/bin/sh

skopeo copy --dest-tls-verify=false \
    oci:/home/student/DO288/labs/external-registry/rhel7-sleep \
    docker://workstation.lab.example.com:5000/rhel7-sleep
