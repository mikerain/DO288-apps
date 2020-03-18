# DO288 Containerized Example Applications

oc new-app https://github.com/openshift/ruby-hello-world -l name=hello-world

oc new-app https://github.com/openshift/test-maven-app -l name=my-maven-app

oc new-app https://github.com/sclorg/cakephp-ex -l name=my-php-app


#chapter1

[app-config]

#chapter2

[app-config]

oc new-project  chapter2-app-config 

git clone https://github.com/woyaowoyao/DO288-apps

DO288-apps/app-config

oc new-app https://github.com/woyaowoyao/DO288-apps.git --context-dir=app-config --name myapp 

oc expose svc/myapp

oc get route

oc create configmap myconfig --from-literal APP_MSG='TEST'

oc get -o json cm/myconfig

oc set env dc/myapp --from cm/myconfig

oc edit configmap/myconfig

 oc rollout latest dc/myapp 

oc create secret generic myappfilesec  --from-file myapp.sec 
 
oc set volume dc/myapp --add  -t secret -m /opt/app-root/secure --name myappsec-vol --secret-name myappfilesec 
[app-config]

[hello-swarm]  design-container
hello-java 
cd hello-java
oc new-project chapter2-hello-swarm-design-container
oc new-app --name hello https://github.com/woyaowoyao/DO288-apps.git --context-dir=hello-java 
oc logs -f bc/hello
oc get pods 
crul http://hello-chapter2-hello-swarm-design-container.apps.os311.test.it.example.com/api/hello

oc create configmap appconfig --from-literal APP_MSG='D288 HELL'
oc set env dc/hello --from cm/appconfig
[hello-swarm]

#chapter4
[java-serverhost]   manage-builds 
cd java-serverhost
oc new-project chapter4-java-serverhost-manage-builds 
oc import-image redhat-openjdk18-openshift --confirm  --reference-policy='local' --from docker.io/redhatopenjdk/redhat-openjdk18-openshift --insecure -n openshift
oc new-app --name jhost -i  redhat-openjdk18-openshift  https://github.com/woyaowoyao/DO288-apps.git --context-dir=java-serverhost 

failed--

oc new-app --name jhost -i  wildfly:9.0  https://github.com/woyaowoyao/DO288-apps.git --context-dir=java-serverhost 
oc new-app -S jee
[java-serverhost]  

[trigger-builds]
docker pull  registry.access.redhat.com/rhscl/php-70-rhel7:7.0-5.14
cd ~/docker-images
docker save registry.access.redhat.com/rhscl/php-70-rhel7:7.0-5.14  -o  php-70-rhel7-newer.tar.gz

sh push-image.sh
vi /etc/hosts
192.x.x.13 docker-registry-default.apps.os311.test.it.example.com

 oc new-project trigger-builds
 oc new-app --name trigger  php~https://github.com/woyaowoyao/DO288-apps.git --context-dir=trigger-builds

 oc expose svc/trigger

http://trigger-trigger-builds.apps.os311.test.it.example.com/

 oc import-image php:latest -n openshift 

 oc get -o json -n openshift is php | grep image     | grep sha256 | head -n 3 
work well

[trigger-builds]

[post-commit]  build-for-managers 
oc new-project post-commit
oc new-app --name builds-for-managers https://github.com/woyaowoyao/DO288-apps.git --context-dir=builds-for-managers

oc new-app --name post-commit https://github.com/woyaowoyao/DO288-apps.git --context-dir=post-commit
[post-commit]

[build-app]
 oc new-project build-app

oc new-app --name simple  https://github.com/woyaowoyao/DO288-apps.git --context-dir=/build-app
oc expose svc/simple
oc describe bc simple
#exes-build-app

$ cat ~/DO288/labs/build-app/oc-new-app.sh

oc new-app --name simple \
 --build-env npm_config_registry=\
http://invalid-server:8081/nexus/content/groups/nodejs \
 http://services.lab.example.com/build-app

 oc set env bc simple \
 npm_config_registry=\
http://services.lab.example.com:8081/nexus/content/groups/nodejs
oc set env bc simple --list
oc start-build simple -F
 oc describe bc simple
-> Webhook Generic
 curl -X POST -k \
 https://master.lab.example.com:443/oapi/v1/namespaces/build-app/
buildconfigs/simple/webhooks/HUKrcFVWQOmA3Dz8822k/generic

 
#exes-
[build-app]

[probes]

[probes]


