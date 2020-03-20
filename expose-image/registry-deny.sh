#!/bin/bash

oc login -u admin -p redhat
oc project default
oc adm policy remove-role-from-user system:registry developer
oc adm policy remove-role-from-user system:image-builder developer
oc login -u developer -p redhat
