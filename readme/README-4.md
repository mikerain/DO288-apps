
# Chapter4

[java-serverhost]   manage-builds 

cd java-serverhost

oc new-project chapter4-java-serverhost-manage-builds 

oc import-image redhat-openjdk18-openshift --confirm  --reference-policy='local' --from docker.io/redhatopenjdk/redhat-openjdk18-openshift --insecure -n openshift

#Work oc new-app  --name jhost -i redhat-openjdk18-openshift:1.2 https://github.com/woyaowoyao/DO288-apps.git --context-dir=java-serverhost


oc new-app --name jhost2 -i fuse7-java-openshift:1.1 https://github.com/woyaowoyao/DO288-apps.git --context-dir=java-serverhost#failed no subscriber

oc new-app --name jhost3 -i  wildfly:9.0  https://github.com/woyaowoyao/DO288-apps.git --context-dir=java-serverhost 

#  oc new-app --name jhost3 -i  java:8  https://github.com/woyaowoyao/DO288-apps.git --context-dir=java-serverhost #workwell

oc start-build bc/jhost 

oc new-app -S jee

[java-serverhost]  

[trigger-builds]

docker pull  registry.access.redhat.com/rhscl/php-70-rhel7:7.0-5.14

cd ~/docker-images

docker save registry.access.redhat.com/rhscl/php-70-rhel7:7.0-5.14  -o  php-70-rhel7-newer.tar.gz

cd /root/DO288-apps/trigger-builds

docker load -i /docker-images/php-70-rhel7-newer.tar.gz

docker tag     registry.access.redhat.com/rhscl/php-70-rhel7:7.0-5.14 \

    docker-registry-default.apps.os311.test.it.example.com:5000/rhscl/php-70-rhel7:latest
	
docker push \

    docker-registry-default.apps.os311.test.it.example.com:5000/rhscl/php-70-rhel7:latest
	
sh push-image.sh

vi /etc/hosts

192.x.x.13 docker-registry-default.apps.os311.test.it.example.com

 oc new-project trigger-builds
 
 oc new-app --name trigger  php~https://github.com/woyaowoyao/DO288-apps.git --context-dir=trigger-builds
 
 oc describe bc/trigger | grep Triggered 
 
 oc expose svc/trigger

http://trigger-trigger-builds.apps.os311.test.it.example.com/

oc import-image php:latest -n openshift 

oc get -o json -n openshift is php | grep image     | grep sha256 | head -n 3 

work well

oc set triggers bc/name --from-gitlab --remove

[trigger-builds]

[post-commit]  build-for-managers 

oc new-project post-commit

# oc new-app --name builds-for-managers https://github.com/woyaowoyao/DO288-apps.git --context-dir=builds-for-managers

oc new-app --name hook  https://github.com/woyaowoyao/DO288-apps.git --context-dir=post-commit

# oc set build-hook bc/hook --post-commit --command -- \
    bash -c "curl -s -S -i -X POST http://builds-formanagers.apps.lab.example.com/api/builds -f -d \"developer=\${DEVELOPER}&git=\	
	${OPENSHIFT_BUILD_SOURCE}&project=\${OPENSHIFT_BUILD_NAMESPACE}\""
	
oc start-build bc/hook -F 

oc set env bc/hook DEVELOPER="Your Name

 oc set env bc/hook --list 
 
 
 $ oc describe bc simple 
 
  curl -X POST -k \    https://master.lab.example.com:443/oapi/v1/namespaces/build-app/ buildconfigs/simple/webhooks/HUKrcFVWQOmA3Dz8822k/generic 
  
[post-commit]


[build-app]

oc new-project build-app

# oc new-app --name simple  https://github.com/woyaowoyao/DO288-apps.git --context-dir=build-app

oc expose svc/simple

oc describe bc simple

$ cat ~/DO288/labs/build-app/oc-new-app.sh

oc new-app --name simple \

 --build-env npm_config_registry=\
 
http://invalid-server:8081/nexus/content/groups/nodejs \

 http://services.lab.example.com/build-app

oc set env bc simple  npm_config_registry=http://services.lab.example.com:8081/nexus/content/groups/nodejs
 
oc set env bc simple --list

oc start-build simple -F
 
oc describe bc simple

-> Webhook Generic

 # curl -X POST -k  https://master.lab.example.com:443/oapi/v1/namespaces/build-app/buildconfigs/simple/webhooks/HUKrcFVWQOmA3Dz8822k/generic
 
 curl -X POST -k   https://master.e380.example.opentlc.com:443/apis/build.openshift.io/v1/namespaces/build-app/buildconfigs/simple/webhooks/asDMAVPxYKyHNZuubM_o/generic

# curl -X POST -k   https://master.3e92.example.opentlc.com:443/apis/build.openshift.io/v1/namespaces/chapter3/buildconfigs/simple/webhooks/8P--cRelt2vu5rNhjQMe/generic
 
#exes-[build-app]

 The URL is accessed as a container registry URL. If this succeeds, there is no need to create a build configuration. OpenShift creates the deployment configuration and other resources required to deploy a container image.
2. If the URL points to a Git repository, OpenShift retrieves a file list from the repository and searches for a Dockerfile. If found, the build configuration uses a docker strategy. Otherwise, the build configuration uses a source strategy, which needs an S2I builder image.
3. OpenShift searches for image streams that match the language builder name as the value of the supports annotation. The first match becomes the S2I builder image.
4. If no annotation matches, OpenShift searches for an image stream whose name matches the language builder name. The first match becomes the S2I builder image.

《charpter4---
#exes-manage-builds

oc new-app --name jhost \    --build-env MAVEN_MIRROR_URL=\ http://services.lab.example.com:8081/nexus/content/groups/training-java \    -i redhat-openjdk18-openshift \    http://services.lab.example.com/java-serverhost

 git clone http://services.lab.example.com/java-serverhost
oc new-app --name jhost --build-env MAVEN_MIRROR_URL=http://services.lab.example.com:8081/nexus/content/groups/training-java -i redhat-openjdk18-openshift http://services.lab.example.com/java-serverhost

 cd  /home/student/javaserverhost/src/main/java/com/redhat/training/example
 vi A.java
 oc start-build jhost
 
#exes-

oc set triggers bc/name --from-image=project/image:tag

oc set triggers bc/name --from-image=project/image:tag --remove

oc set triggers bc/name --from-gitlab

oc set triggers bc/name --from-gitlab --remove

#exes--webhook

oc new-app --name version --build-env MAVEN_MIRROR_URL=http://services.lab.example.com:8081/nexus/content/groups/training-java -i redhat-openjdk18-openshift http://services.lab.example.com/java-serverhost

$ curl -X POST -k \

 https://master.lab.example.com:443/oapi/v1/namespaces/manage-builds/
 
buildconfigs/version/webhooks/YuQyNTR6Moh38n6eor-D/generic

#exes-

#exes--trigger-builds

oc new-app --name trigger \ php~http://services.lab.example.com/trigger-builds

oc describe bc/trigger | grep Triggered

&&&&--

cat push-image.sh 

#!/bin/bash

cd ~/DO288/labs/trigger-builds

docker load -i php-70-rhel7-newer.tar.gz

docker tag \

    registry.lab.example.com:5000/rhscl/php-70-rhel7:7.0-5.14 \
	
    registry.lab.example.com:5000/rhscl/php-70-rhel7:latest
	
docker push \

    registry.lab.example.com:5000/rhscl/php-70-rhel7:latest


oc login -u admin -p redhat  https://master.lab.example.com

oc login -u develper -p redhat  https://master.lab.example.com

oc describe build trigger-2 | grep cause

oc import-image php:latest -n openshift

# oc import-image docker.io/redhatopenjdk/redhat-openjdk18-openshift:latest -n openshift
#exes-

#exes--post-commit

oc set build-hook bc/name \

 --post-commit \
 
 --command \
 
 -- bundle exec rake test --verbose

oc set build-hook bc/name --post-commit --script="curl http://api.com/user/${USER}"

cd /DO288/labs/post-commit
 
@$$$$$$$$$$$$$$$$$$$$
 cat create-hook.sh 
#!/bin/bash

oc set build-hook bc/hook --post-commit --command -- \

    bash -c "curl -s -S -i -X POST http://builds-for-managers.apps.lab.example.com/api/builds -f -d \"developer=\${DEVELOPER}&git=\${OPENSHIFT_BUILD_SOURCE}&project=\${OPENSHIFT_BUILD_NAMESPACE}\""

[student@workstation post-commit]$ 

@$$$$$$$$$$$$$$$$$$$$

oc describe bc/hook | grep Post

oc start-build bc/hook -F

oc set env bc/hook DEVELOPER="Your Name"

oc set env bc/hook --list

#exes-

#exes-build-app

$ cat ~/DO288/labs/build-app/oc-new-app.sh

oc new-app --name simple \

 --build-env npm_config_registry=\
 
http://invalid-server:8081/nexus/content/groups/nodejs  http://services.lab.example.com/build-app

 oc set env bc simple \
 
 npm_config_registry=http://services.lab.example.com:8081/nexus/content/groups/nodejs
 
oc set env bc simple --list

oc start-build simple -F

 oc describe bc simple
 
-> Webhook Generic

 curl -X POST -k \
 
 https://master.lab.example.com:443/oapi/v1/namespaces/build-app/buildconfigs/simple/webhooks/HUKrcFVWQOmA3Dz8822k/generic

#exes-

oc set build-hook bc/name \    --post-commit \    --command \    -- bundle exec rake test --verbose

@@@@@lab/post-commit

oc new-app --name hook \    php~http://services.lab.example.com/post-commit

oc set build-hook bc/hook --post-commit --command -- \    

bash -c "curl -s -S -i -X POST http://builds-formanagers.apps.lab.example.com/api/builds -f -d \"developer=\${DEVELOPER}&git=\

 ${OPENSHIFT_BUILD_SOURCE}&project=\${OPENSHIFT_BUILD_NAMESPACE}\""
 
 oc start-build bc/hook -F 

 oc set env bc/hook DEVELOPER="Your Name"
 
 oc set env bc/hook --list 
 
 http://builds-for-managers.apps.lab.example.com
 

