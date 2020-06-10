
# Chapter7
 
[probes]

oc new-project probes

oc new-app --name probes    --build-env npm_config_registry=https://registry.npm.taobao.org https://github.com/woyaowoyao/DO288-apps.git --context-dir=/probes

http://probes-probes.apps.os311.test.it.example.com/flip?op=kill
change to unhealthy


#exes-probes [probes]

oc new-app --name probes  --build-env npm_config_registry=http://services.lab.example.com:8081/nexus/content/groups/nodejs  http://services.lab.example.com/probes
 
curl -i http://probes.apps.lab.example.com/healthz

curl -i http://probes.apps.lab.example.com/ready
  
 cat kill.sh 
 
#!/bin/bash

curl http://probes.apps.lab.example.com/flip?op=kill

#exes-
oc rollout latest dc/name

oc rollout history dc/name

oc rollout history dc/name --revision=1

oc rollout cancel dc/name

oc set triggers dc/name --auto

oc logs --version=1 dc/name

oc scale dc/name --replicas=3

charpter7---》

--DO288-END->

[strategy]

oc new-project strategy

oc new-app --name mysql  -e MYSQL_USER=test -e MYSQL_PASSWORD=redhat -e MYSQL_DATABASE=testdb  --docker-image docker.io/centos/mysql-57-centos7  --insecure-registry

oc get pods -o wide 

oc describe dc/mysql | grep 'Strategy:' 

oc set triggers dc/mysql --from-config --remove 

oc patch dc/mysql --patch  '{"spec":{"strategy":{"type":"Recreate"}}}' 

oc patch dc/mysql --type=json    -p='[{"op":"remove", "path": "/spec/strategy/rollingParams"}]' 

oc rollout history dc/name

oc set triggers dc/name --auto

oc rollout retry dc/name

oc scale dc/name --replicas=3

$ oc get dc -o yaml | grep -A 4 readiness
[strategy]
 oc get events | grep failed 
 
[camel-hello]
oc new-app --name camelHelloApp  https://github.com/woyaowoyao/DO288-apps.git --context-dir=/camel-hello
[camel-hello]


[camel-hello]
oc new-app --name camelTimeApp  https://github.com/woyaowoyao/DO288-apps.git --context-dir=/camel-timer
 [camel-hello]
 

 

# Chapter8

oc new-app --name nexus3  https://github.com/woyaowoyao/DO288-apps.git --context-dir=/nexus3

oc new-app --name nexus3    --file nexus-template.yaml     -p HOSTNAME=nexus.apps.e380.example.opentlc.com

chown -R ${USER_NAME}:0 ${NEXUS_DATA} && \ chmod -R g+rw ${NEXUS_DATA} /etc/passwd && \

podman login registry.connect.redhat.com
Username: {REGISTRY-SERVICE-ACCOUNT-USERNAME}
Password: {REGISTRY-SERVICE-ACCOUNT-PASSWORD}
Login Succeeded!

$ podman pull registry.connect.redhat.com/sonatype/nexus-repository-manager

 <--DO288-START
--image-stream or -i Provides the image stream to be used as either the S2I builder image for an S2I build or to deploy a container image. 
--strategy Provides the build strategy, usually docker or source. 
--code Provides the URL to a Git repository to be used as input to an S2I build. 
--docker-image Provides the URL to a container image to be deployed.




/etc/origin/node/node-config.yaml