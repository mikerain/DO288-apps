# DO288 Containerized Example Applications

oc new-app https://github.com/openshift/ruby-hello-world -l name=hello-world

oc new-app https://github.com/openshift/test-maven-app -l name=my-maven-app

oc new-app https://github.com/sclorg/cakephp-ex -l name=my-php-app


# Chapter1

[source-build]

new-app --name hello --build-env npm_config_registry=http://services.lab.example.com:8081/nexus/content/groups/nodejs http://services.lab.example.com/nodejs-helloworld 

new-app --name hello  https://github.com/woyaowoyao/DO288-apps.git --context-dir=nodejs-helloworld

[source-build]

<--CHAPTE1-20200313-14

#导入image 生成is,以便进行new-app 

 oc import-image tomcat:8.5-alpine --from docker.io/tomcat:8.5-alpine --confirm
 
#进行new-app

oc new-app -i charpter1-source-build/tomcat:8.5-alpine --name my-tomcat-app
 
oc new-app php~http://gitserver.example.com/mygitrepo

oc new-app -i php http://gitserver.example.com/mygitrepo

oc new-app php:7.0~http://gitserver.example.com/mygitrepo

oc new-app -i php:7.0 http://gitserver.example.com/mygitrepo

oc new-app myis~http://gitserver.example.com/mygitrepo

oc new-app -i myis http://gitserver.example.com/mygitrepo

oc new-app -i myis --strategy source --code http://gitserver.example.com/mygitrepo

? the standard S2I image streams provided by OpenShift

oc new-app registry.example.com/mycontainerimage

oc delete all -l app=test

oc new-app --strategy docker http://gitserver.example.com/mydockerfileproject

oc new-app --strategy source http://gitserver.example.com/user/mygitrepo

oc new-app --code http://gitserver.example.com/mygitrepo 

oc new-app --docker-image registry.example.com/mycontainerimage

oc new-app --name hello -i php --code http://gitserver.example.com/mygitrepo

oc delete all -l app=test

oc new-app -o json registry.example.com/mycontainerimage

oc new-app --name='blue' --labels=name="blue" php~https://github.com/redhat-gpte-devopsautomation/cotd.git -o json

oc import-image myis --confirm \    --from registry.acme.example.com:5000/acme/awesome --insecure


<deploy-image 

oc new-project hello

oc new-app --name ahttpd httpd:2.4

oc new-project common
 
oc import-image apache-httpd --confirm \    --from docker-registry.default.svc:5000/hello/ahttpd --insecure #local-vm

oc import-image apache-httpd --confirm \    --from registry.lab.example.com:5000/do288/apache-httpd --insecure 
 
--exec>

<exec--

student@workstation ~]$ lab docker-build setup

git clone http://services.lab.example.com/rhel7-echo

--exec>

 lab docker-build setup
 
$ git clone http://services.lab.example.com/rhel7-echo

$ cat ~/rhel7-echo/Dockerfile

FROM registry.lab.example.com:5000/rhel7:7.3 CMD bash -c "while true; do echo test; sleep 5; done" 

git clone https://github.com/woyaowoyao/D288-ch1-01-rhel7-7-echo.git

oc new-app --name echo --insecure-registry  https://github.com/woyaowoyao/D288-ch1-01-rhel7-7-echo.git

oc new-app --name echo2 --insecure-registry=true http://gogs-cicd.apps.os311.test.it.example.com/root/D288-ch1-01-rhel7-7-echo.git

#ERROR:build error: Failed to push image: unauthorized: unable to validate token-> 重启虚拟机

oc start-build echo
 
oc get all --export  --as-template=jeesite-demo
 
https://github.com/RedHatTraining/DO288-apps/tree/master/php-helloworld
 
cat /proc/sys/kernel/hostname 
  
oc logs -f bc/echo

oc describe echo-5-htskx 

oc status --suggest

oc logs echo-5-htskx -c echo

oc adm policy add-scc-to-user anyuid -n do288-cha1 -z default
 
oc import-image php --confirm \    --from  --insecure

oc import-image apache-httpd --confirm  --from  registry.lab.example.com:5000/do288/apache-httpd --insecure 

oc import-image apache-httpd --confirm  --from docker.io/httpd --insecure 

docker-registry.default.svc:5000/do288-cha1/apache-httpd --insecure 

oc cp frontend-1-zvjhb:/var/log/httpd/error_log /tmp/frontend-server.log

oc rsh hello-1-89mhn ps ax

oc rsh -t hello-1-89mhn

 oc policy add-role-to-user view system:serviceaccount:top-secret:robot
 
 <--import  import-->

oc get templates -n openshift | grep php | grep mysql 
 
oc get templates/cakephp-mysql-example -o yaml >cakephp-mysql-example.yaml -n openshift
 
#create-app.sh template

oc new-app --template openshift/cakephp-mysql-example -p NAME=quotesapi   -p APPLICATION_DOMAIN=quotes-do288-cha1.apps.os311.test.it.example.com -p SOURCE_REPOSITORY_URL=http://gogs-cicd.apps.os311.test.it.example.com/root/do288-apps  -p CONTEXT_DIR=quotes -p DATABASE_SERVICE_NAME=quotesdb  -p DATABASE_USER=user1 -p DATABASE_PASSWORD=mypa55   --name quotes
  
cd /C/cloud/openshift/servers/test-files/rhoar-getting-started/origin-examples/quickstarts

oc create -f cakephp-mysql.json

oc logs -f bc/quotesapi

oc describe svc quotesdb | grep Endpoints 

oc describe pod quotesapi-1-5zncm | grep -A 5 Environment

oc rsh quotesapi-1-5zncm bash -c \    'curl $DATABASE_SERVICE_NAME:3306' 

mysql -h 110.110.110.110 -uroot -p abcd123

create database name; 创建数据库

　　use databasename; 选择数据库
  
　　drop database name 直接删除数据库，不提醒
  
　　show tables; 显示表
  
　　describe tablename; 表的详细描述
  
　　select中加上distinct去除重复字段
  
　　mysqladmin drop database name 删除数据库前，有提示。

oc cp ./DO288/labs/build-template/quote.sql \    quotesdb-1-hh2g9:/tmp/quote.sql
 
oc rsh -t quotesdb-1-hh2g9 
 
mysql -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /tmp/quote.sql 

npm config set registry https://registry.npm.taobao.org 

npm info underscore

oc new-app --name hello     --build-env npm_config_registry=http://services.lab.example.com:8081/nexus/content/groups/nodejs     

http://services.lab.example.com/nodejs-helloworld

oc new-app --name hello --build-env npm_config_registry=https://registry.npm.taobao.org --code https://github.com/woyaowoyao/DO288-apps/tree/master/nodejs-helloworld

oc new-app --name hello  --code https://github.com/woyaowoyao/DO288-apps.git --context-dir=nodejs-helloworld

oc new-app --name hello --build-env npm_config_registry=https://registry.npm.taobao.org --code https://github.com/woyaowoyao/DO288-apps.git --context-dir=nodejs-helloworld

#http://services.lab.example.com:8081/nexus/content/groups/nodejs

http://services.lab.example.com/nodejs-helloworld 

 python -m json.tool nodejs-helloworld/package.json
 
 oc start-build --follow bc/hello 

 oc adm policy add-scc-to-user anyuid -z apacheuser

oc set env dc/mydcname     --from configmap/myconf

oc set volume dc/mydcname --add     -t configmap -m /path/to/mount/volume \    --name myvol --configmap-name myconf

oc set env dc/mydcname     --from secret/mysecret

oc set volume dc/mydcname --add -t secret -m /path/to/mount/volume     --name myvol --secret-name mysecret

oc set triggers dc/mydcname --from-config --remove

oc set triggers dc/mydcname --from-config

oc rollout latest mydcname

#exes-build-template
cat ~/DO288/labs/build-template/create-app.sh oc new-app --template common/php-mysql-ephemeral \  -p NAME=quotesapi \  -p APPLICATION_DOMAIN=quote.apps.lab.example.com \  -p SOURCE_REPOSITORY_URL=http://services.lab.example.com/quotes \  -p DATABASE_SERVICE_NAME=quotesdb \  -p DATABASE_USER=user1 \  -p DATABASE_PASSWORD=mypa55 \  --name quotes

oc describe svc quotesdb | grep Endpoints 


#exes- source-build 20200317

oc new-app https://github.com/woyaowoyao/DO288-apps.git --context-dir=nodejs-helloworld --name hello

oc new-app https://github.com/youruser/yourgitrepo --context-dir=nodejs-helloworld

oc expose svc/hello

oc start-build hello -F

#nodejs-helloworld

# Chapter2

docker pull  registry.access.redhat.com/rhscl/nodejs-6-rhel7


oc create serviceaccount apacheuser

oc login -u admin -p redhat https://master.lab.example.com

oc adm policy add-scc-to-user anyuid -z apacheuser

oc patch dc/demo-app --patch \    '{"spec":{"template":{"spec":{"serviceAccountName": "myserviceaccount"}}}}'

oc describe scc/restricted  oc describe scc/anyuid


#  RUN chgrp -R 0 directory && \    chmod -R g=u directory

# exes-onbuild-demo

oc new-app https://github.com/woyaowoyao/DO288-apps.git --context-dir=onbuild-demo --name onbuild-demo

EXPOSE 8080 

LABEL io.openshift.expose-services="8080:http

RUN sed -i "s/listen 80/listen 8080/g" /etc/nginx.conf

RUN chgrp -R 0 /var/opt/rh/rh-nginx18 && chmod -R g=u /var/opt/rh/rh-nginx18

#exes-

# exes-container-build

git clone \    http://services.lab.example.com/container-build

oc new-project container-build

oc new-app --name hello \    http://services.lab.example.com/container-build \    --insecure-registry 

oc create serviceaccount apacheuse

oc login -u admin -p redhat  https://master.lab.example.com/

oc project container-build

oc adm policy add-scc-to-user anyuid -z apacheuser

oc login -u developer -p redhat \    https://master.lab.example.com

oc edit dc/hell
terminationGracePeriodSeconds: 30      

serviceAccountName: apacheuse

RUN sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf

RUN chgrp -R 0 /var/log/httpd /var/run/httpd && \    chmod -R g=u /var/log/httpd /var/run/httpd

USER 1001

git commit -a -m "fix"

oc delete project container-build

#exes-

#exes-dd

oc create cm myconf --from-literal key1=value1 

oc get cm myconf

oc get configmap/myconf -o json

oc edit configmap/myconf

oc delete configmap/myconf

oc patch configmap/myconf --patch \    '{"data":{"key1":"newvalue1"}}'

oc get secret/mysecret -o json

echo 'newpassword' | base64

oc edit secret/mysecret

oc create secret generic secret_name \    --from-file /home/demo/mysecret.txt

oc set env dc/mydcname \    --from secret/mysecret

 #disable 
 
oc set volume dc/mydcname --add  -t secret -m /path/to/mount/volume \    --name myvol --secret-name mysecret

oc set triggers dc/mydcname --from-config --remove

 #re-enable 
 
oc set triggers dc/mydcname --from-config

oc rollout latest mydcnam

#exes-dd

# exes-app-config 

 oc new-app --name myapp \    --build-env npm_config_registry=\ http://services.lab.example.com:8081/nexus/content/groups/nodejs \    http://services.lab.example.com/app-config 

oc set env bc/myapp --from configmap/myappconf 

$ oc set volume dc/myapp --add \    -t secret -m /opt/app-root/secure \    --name myappsec-vol --secret-name myappfilesec 

 oc rsh myapp-3-wzdbh env | grep APP_MSG 
 
#exes-


# exes-design-container

RUN chgrp -R 0 /opt/app-root && \ chmod -R g=u /opt/app-root 

USER 100

git commit -a -m  'FIX'
 
oc create configmap appconfig \    --from-literal APP_MSG="Elvis lives"

oc set env dc/hello --from configmap/appconfig

oc rsh hello-3-ks1np env | grep APP_MSG 

oc edit configmap/appconfig

#exes-

RUN chgrp -R 0 /var/log/httpd /var/run/httpd && \    chmod -R g=u /var/log/httpd /var/run/httpd

# exes-app-config 


oc new-app --name myap centos/nodejs-8-centos7~https://github.com/woyaowoyao/DO288-apps.git --context-dir=app-config
$ oc create configmap myappconf    --from-literal APP_MSG="Test Message" 

oc get -o yaml configmap/myappconf

oc describe configmap/myappconf 

oc create secret generic myappfilesec --from-file /root/redhat-do288/do288-apps/app-config/myapp.sec 

oc create secret generic myappfilesec --from-file /root/github/DO288-apps/app-config//myapp.sec

oc create secret generic secret_name \    --from-file /home/demo/mysecret.txt

oc create configmap config_map_name \    --from-literal key1=value1 \    --from-literal key

oc create configmap config_map_name \    --from-file /home/demo/conf.tx

oc set env dc/myapp \    --from configmap/myappconf
oc set env dc/myap \    --from secret/myappfilesec
oc set volume dc/mydcname --add \    -t configmap -m /path/to/mount/volume \    --name myvol --configmap-name myconf

 oc set volume dc/myap --add -t secret -m /opt/app-root/secure --name myappsec-vol --secret-name myappfilesec 
 
oc set env dc/mydcname \    --from secret/mysecret

#暂停触发

oc set triggers dc/mydcname --from-config --remove

#启用触发

oc set triggers dc/mydcname --from-config

$ oc rollout latest dc/hello

skopeo copy --dest-tls-verify=false oci:myimage docker://registry.example.com/myimage

skopeo copy --dest-tls-verify=false oci:myimage \    docker://registry.example.com/ #invalid destination URL

skopeo delete --tls-verify=false docker://registry.example.com/myimag

sudo yum install docker-distribution skopeo 
 
skopeo copy --dest-tls-verify=false \    oci:/home/student/DO288/labs/external-registry/rhel7-sleep \    docker://workstation.lab.example.com:5000/rhel7-sleep

oc adm policy add-role-to-user system:registry user_name 

oc adm policy add-role-to-user system:image-builder user_name

export TOKEN=$(oc whoami -t)

docker login -u myuser -p $TOKEN myregistry.example.com

skopeo copy --creds=myuser:$TOKEN docker://myregistry.example.com/...

oc policy add-role-to-group -n img_project system:image-puller \    system:serviceaccounts:app_project


oc set volume dc/mydcname --add \
 -t secret -m /path/to/mount/volume \    --name myvol --secret-name mysecret
 
oc set triggers dc/mydcname --from-config --remove

oc set triggers dc/mydcname --from-config

oc rollout latest mydcname


[source-build]

oc new-project  source-build

oc new-app https://github.com/woyaowoyao/DO288-apps.git --context-dir=nodejs-helloworld --name hello
 
 oc start-build --follow bc/hello 
 
#2020-0523-start 可运行

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

oc edit configmap/myappconf

[app-config]

[hello-swarm]  design-container

hello-java && cd hello-java

oc new-project chapter2-hello-swarm-design-container

oc new-app --name hello https://github.com/woyaowoyao/DO288-apps.git --context-dir=hello-java 

oc logs -f bc/hello

oc get pods 

crul http://hello-chapter2-hello-swarm-design-container.apps.os311.test.it.example.com/api/hello

oc create configmap appconfig --from-literal APP_MSG='D288 HELL'

oc set env dc/hello --from cm/appconfig

oc rsh hello-3-ks1np env | grep APP_MSG 
 
path= api/hello

http://hello-chapter2-hello-swarm-design-container.apps.e380.example.opentlc.com/api/hello

[hello-swarm]

# Charpter3

#pull下载

oc adm policy add-role-to-user system:registry developer 

#push上传

oc adm policy add-role-to-user system:image-builder developer

oc policy add-role-to-group -n img_project system:image-puller \    system:serviceaccounts:app_project

skopeo copy --dest-tls-verify=false \    --dest-creds=developer:$TOKEN \ 
  
oci:/home/student/DO288/labs/expose-registry/rhel7-info \    docker://docker-registry-default.apps.lab.example.com/common/rhel7-info
 
grep INSECURE_REGISTRY \    ~/DO288/solutions/expose-registry/docker 
 
adding the registry to the INSECURE_REGISTRY line and uncommenting it. #INSECURE_REGISTRY='--insecure-registry registry.lab.example.com:5000' INSECURE_REGISTRY='--insecure-registry registry.lab.example.com:5000 --insecureregistry  docker-registry-default.apps.lab
 
sudo cp ~/DO288/solutions/expose-registry/docker \    /etc/sysconfig/docker

sudo systemctl status docker 

sudo systemctl start docker 

oc import-image myis --confirm --insecure  --from registry.example.com:5000/myimage
 
sudo systemctl start docker-distribution

sudo systemctl status docker-distribution

sudo systemctl enable docker-distribution 
  
#镜像导入到本地私有镜像仓库中--reference-policy='local'

oc import-image openshift/jenkins:v3.10 --reference-policy='local' --from=docker.io/openshift/jenkins-2-centos7:v3.10 --confirm

导入镜像时，referencePolicy.type默认为source。

oc import-image openshift/jenkins:v3.10 --from=docker.io/openshift/jenkins-2-centos7:v3.10 --confirm


oc adm policy add-role-to-user system:registry andrew
 
oc adm policy add-role-to-user system:image-builder andrew

#exes-image-stream

oc import-image hello-world --confirm  --from registry.lab.example.com:5000/hello-world-nginx --insecure
 
docker login -u myuser -p $TOKEN docker-registry.default.svc:5000

docker pull xxxxx 

oc new-app --name hello -i common/hello-world

#exes-

#exes- expose-image

oc login -u admin -p redhat  https://master.lab.example.com

 registry-grant.sh
 
#!/bin/bash

oc project default

oc adm policy add-role-to-user system:registry developer

oc adm policy add-role-to-user system:image-builder developer

oc login -u developer -p redhat https://master.lab.example.com

 cat project-grant.sh
 
#!/bin/bash

 oc policy add-role-to-group system:image-puller system:serviceaccounts:expose-image
 
 cat registry-deny.sh 
 
#!/bin/bash

oc login -u admin -p redhat

oc project default

oc adm policy remove-role-from-user system:registry developer

oc adm policy remove-role-from-user system:image-builder developer
oc login -u developer -p redhat

 export TOKEN=$(oc whoami -t)
 
 cat push-image.sh 
 
#!/bin/bash

skopeo copy --dest-tls-verify=false \
    --dest-creds=developer:$TOKEN \
    oci:/home/student/DO288/labs/expose-image/php-info \
    docker://docker-registry-default.apps.lab.example.com/common/php-info




sudo yum install docker-distribution skopeo 
 
cat ~/DO288/labs/external-registry/config-firewall.sh 
  
/etc/docker-distribution/registry/config.yml 

sudo systemctl start docker-distribution 
 
sudo systemctl enable docker-distribution 
 
sudo systemctl status docker-distribution 
 
 ~/DO288/labs/external-registry/push-image.sh 
 
cat /etc/docker-distribution/registry/config.yml     | grep rootdirectory 
 
find /var/lib/registry/ -name rhel7-sleep 
  
sudo systemctl status docker 
  
  
oc new-app --name sleep \    --docker-image workstation.lab.example.com:5000/rhel7-sleep 
  
As root user, open the /etc/sysconfig/docker file with a text editor and locate the following line:
 
INSECURE_REGISTRY='--insecure-registry registry.lab.example.com:5000'

INSECURE_REGISTRY='--insecure-registry registry.lab.example.com:5000 --insecureregistry workstation.lab.example.com:5000'

sudo systemctl restart docker
sudo systemctl status docker 

 docker run -d --name test \    workstation.lab.example.com:5000/rhel7-sleep 
 
# Importance]
system:registry 

This role allows a user to pull images from the internal registry.

system:image-builder 

This role allows a user to push images to the internal registry.

oc adm policy add-role-to-user system:registry user_name 

oc adm policy add-role-to-user system:image-builder user_name

export TOKEN=$(oc whoami -t)

docker login -u myuser -p $TOKEN myregistry.example.com

oc policy add-role-to-group -n img_project system:image-puller \    system:serviceaccounts:app_project

docker rm $(docker ps -aq)

docker rmi -f $(docker images -aq)

oc import-image hello-world --confirm \    --from registry.lab.example.com:5000/hello-world-nginx --insecure 
 
grep INSECURE_REGISTRY \    ~/DO288/solutions/expose-registry/docker 

sudo cp ~/DO288/solutions/expose-registry/docker \    /etc/sysconfig/docker

sudo systemctl restart docker 

sudo systemctl status docker 

# Importance


# Chapter4

[java-serverhost]   manage-builds 

cd java-serverhost

oc new-project chapter4-java-serverhost-manage-builds 

oc import-image redhat-openjdk18-openshift --confirm  --reference-policy='local' --from docker.io/redhatopenjdk/redhat-openjdk18-openshift --insecure -n openshift

#Work oc new-app  --name jhost -i redhat-openjdk18-openshift:1.2 https://github.com/woyaowoyao/DO288-apps.git --context-dir=java-serverhost


oc new-app --name jhost2 -i fuse7-java-openshift:1.1 https://github.com/woyaowoyao/DO288-apps.git --context-dir=java-serverhost#failed no subscriber

oc new-app --name jhost3 -i  wildfly:9.0  https://github.com/woyaowoyao/DO288-apps.git --context-dir=java-serverhost 

#Work oc new-app --name jhost3 -i  java:8  https://github.com/woyaowoyao/DO288-apps.git --context-dir=java-serverhost #workwell

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

oc new-app --name builds-for-managers https://github.com/woyaowoyao/DO288-apps.git --context-dir=builds-for-managers

oc new-app --name hook  https://github.com/woyaowoyao/DO288-apps.git --context-dir=post-commit

oc set build-hook bc/hook --post-commit --command -- \

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

oc new-app --name simple  https://github.com/woyaowoyao/DO288-apps.git --context-dir=build-app

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

 curl -X POST -k  https://master.lab.example.com:443/oapi/v1/namespaces/build-app/buildconfigs/simple/webhooks/HUKrcFVWQOmA3Dz8822k/generic
 
 curl -X POST -k   https://master.e380.example.opentlc.com:443/apis/build.openshift.io/v1/namespaces/build-app/buildconfigs/simple/webhooks/asDMAVPxYKyHNZuubM_o/generic

 
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

oc import-image docker.io/redhatopenjdk/redhat-openjdk18-openshift:latest -n openshift
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
 
@@@@@
#charpter4---》

# Chapter5

#work 考试

[s2i-scripts]

sudo docker pull registry.access.redhat.com/rhscl/httpd-24-rhel7:latest

docker run --name test -it registry.access.redhat.com/rhscl/httpd-24-rhel7 bash

cat /usr/libexec/s2i/assemble 
cat /usr/libexec/s2i/run 
cat /usr/libexec/s2i/usage 

sudo docker run --name test1 -it docker-registry.default.svc:5000/openshift/httpd bash

#work sudo oc import-image openshift/jenkins:v3.10 --from=docker.io/openshift/jenkins-2-centos7:v3.10 --confirm

sudo oc import-image openshift/jenkins:v3.10 --reference-policy='local' --from=docker.io/openshift/jenkins-2-centos7:v3.10 --confirm

sudo oc import-image rhscl/httpd-24-rhel7:latest --from registry.access.redhat.com/rhscl/httpd-24-rhel7:latest --confirm

sudo docker tag registry.access.redhat.com/rhscl/httpd-24-rhel7   docker-registry.default.svc:5000/httpd-24:latest

sudo docker tag registry.access.redhat.com/rhscl/httpd-24-rhel7   docker.io/robin9999/httpd-24:latest

sudo oc import-image my-httpd --from=docker.io/robin9999/httpd-24 --confirm

sudo oc import-image httpd-24 --from registry.access.redhat.com/rhscl/httpd-24-rhel7:latest    --confirm --insecure=true

sudo oc import-image docker-registry.default.svc:5000/openshift/httpd-24:latest --from registry.access.redhat.com/rhscl/httpd-24-rhel7:latest    --confirm --insecure=true

oc import-image sonatype/nexus-repository-manager --from=registry.connect.redhat.com/sonatype/nexus-repository-manager --confirm

oc import-image my-ruby --from=docker.io/openshift/ruby-20-centos7 --confirm

#work oc new-project do288-5

oc new-app --name hello  httpd https://github.com/woyaowoyao/DO288-apps.git --context-dir=s2i-scripts
vi assemble
#@@@@考试
######## CUSTOMIZATION START HERE ############

echo "---> Installing application source"

cp -Rf /tmp/src/*.html ./

# Import
DATE=`date "+%b %d, %Y @ %H:%M %p"`

echo "---> Creating info page"

echo "Page built on $DATE" >> ./info.html

echo "Proudly served by Apache HTTP Server version $HTTPD_VERSION" >> ./info.html

$ oc expose svc hello --port 8080     --hostname hello.apps.lab.example.com 

######## CUSTOMIZATION ENDS HERE ############

run-httpd -e debug $@

[s2i-scripts]@@@@

skopeo delete --tls-verify=false \    docker://registry.lab.example.com:5000/s2i-do288-httpd

oc describe dc/mysql | grep -A 3 'Strategy:' 

[s2i build]

s2i create image_name director

docker build -t builder_image .

docker build -t s2i-do288-httpd . 

s2i build src builder_image tag_name

s2i build test/test-app s2i-do288-nginx nginx-test

docker tag s2i-do288-nginx         myregistry.example.com:5000/s2i-do288-nginx

docker tag s2i-do288-nginx         myregistry.example.com:5000/s2i-do288-nginx

docker push myregistry.example.com:5000/s2i-do288-nginx

oc import-image s2i-do288-nginx     --from myregistry.example.com:5000/s2i-do288-nginx     --confirm --insecure=true

oc new-app --name nginx-test    s2i-do288-nginx~git_repository

[s2i build]

s2i-do288-httpd]-apache-s2i

docker build -t s2i-do288-httpd . 

s2i create s2i-do288-httpd s2i-do288-httpd

s2i build test/test-app/ \    s2i-do288-httpd s2i-sample-app 
  
[s2i-do288-httpd]
 
curl -s https://api.github.com/repos/openshift/source-to-image/releases/latest | grep browser_download_url 　| grep linux-amd64 　| cut -d '"' -f 4 | wget -qi -
curl -s  https://github-production-release-asset-2e65be.s3.amazonaws.com/16323162/6826d880-f1bd-11e9-8535-6d823d5af0bd?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20200321%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20200321T031222Z&X-Amz-Expires=300&X-Amz-Signature=9dd0e334ad0cbc4664d863900b075df1835fc9ff4389c04136da299006498a74&X-Amz-SignedHeaders=host&actor_id=9347028&response-content-disposition=attachment%3B%20filename%3Dsource-to-image-v1.2.0-2a579ecd-linux-amd64.tar.gz&response-content-type=application%2Foctet-stream
tree -a 
　 docker run --name test -u 1234    -p 8080:8080 -d s2i-sample-app 
#chapter5

# Chapter6
223p
考试检查模板文件错误

oc export is,bc,dc,svc,route,pvc --as-template test \    > ~/test-template.yaml

grep kind: test-template.yaml
  
diff ~/test-template.yaml \    ~/DO288/labs/create-template/quotes-template-clean.yaml \
   
# Chapter7
 
[probes]

oc new-project probes

oc new-app --name probes    --build-env npm_config_registry=https://registry.npm.taobao.org https://github.com/woyaowoyao/DO288-apps.git --context-dir=/probes

http://probes-probes.apps.os311.test.it.example.com/flip?op=kill
change to unhealthy

[probes]
《charpter7---
#exes-probes
oc new-app --name probes \

 --build-env npm_config_registry=http://services.lab.example.com:8081/nexus/content/groups/nodejs \
 
 http://services.lab.example.com/probes
 
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
 
