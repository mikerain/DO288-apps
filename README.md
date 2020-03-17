# DO288 Containerized Example Applications

This repository contains a collection of sample containerized applications.  To complete the course you need to fork this repo into your personal Github account.

#2020-0316

git checkout -b OCP-3.6

git commit -a -m 'create new branch for OCP-3.6 based OCP-4.1-1 from redhat training'

git push --set-upstream origin OCP-3.6




oc adm -h
oc debug
###################################################################################################################################################################################################

<--DO288-START

--image-stream or -i Provides the image stream to be used as either the S2I builder image for an S2I build or to deploy a container image. 
--strategy Provides the build strategy, usually docker or source. 
--code Provides the URL to a Git repository to be used as input to an S2I build. 
--docker-image Provides the URL to a container image to be deployed.

<--CHAPTE1-20200313-14
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

<exec--
student@workstation ~]$ lab docker-build setup
git clone http://services.lab.example.com/rhel7-echo



--exec>


 lab docker-build setup
$ git clone http://services.lab.example.com/rhel7-echo

$ cat ~/rhel7-echo/Dockerfile
FROM registry.lab.example.com:5000/rhel7:7.3 
CMD bash -c "while true; do echo test; sleep 5; done" 

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
oc import-image apache-httpd --confirm  --from 192.168.85.13:5000/do288-cha1/apache-httpd --insecure 
oc import-image apache-httpd --confirm  --from docker.io/httpd --insecure 
docker-registry.default.svc:5000/do288-cha1/apache-httpd --insecure 

oc cp frontend-1-zvjhb:/var/log/httpd/error_log /tmp/frontend-server.log
oc rsh hello-1-89mhn ps ax
oc rsh -t hello-1-89mhn

 oc policy add-role-to-user view system:serviceaccount:top-secret:robot
 <--import 
 
 import-->
CHAPTE1-->

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
oc new-app --name hello --build-env npm_config_registry=https://registry.npm.taobao.org --code https://github.com/woyaowoyao/DO288-apps/tree/master/nodejs-helloworld
oc new-app --name hello  --code https://github.com/woyaowoyao/DO288-apps.git --context-dir=nodejs-helloworld
oc new-app --name hello --build-env npm_config_registry=https://registry.npm.taobao.org --code https://github.com/woyaowoyao/DO288-apps.git --context-dir=nodejs-helloworld
#http://services.lab.example.com:8081/nexus/content/groups/nodejs
http://services.lab.example.com/nodejs-helloworld 

 python -m json.tool nodejs-helloworld/package.json
 oc start-build --follow bc/hello 

 oc adm policy add-scc-to-user anyuid -z apacheuser

oc set env dc/mydcname \    --from configmap/myconf
oc set volume dc/mydcname --add \    -t configmap -m /path/to/mount/volume \    --name myvol --configmap-name myconf
oc set env dc/mydcname \    --from secret/mysecret
oc set volume dc/mydcname --add \
-t secret -m /path/to/mount/volume \    --name myvol --secret-name mysecret
oc set triggers dc/mydcname --from-config --remove
oc set triggers dc/mydcname --from-config
oc rollout latest mydcname

nodejs-helloworld

<--CHAPTE2
oc create serviceaccount apacheuser
oc login -u admin -p redhat https://master.lab.example.com
 oc adm policy add-scc-to-user anyuid -z apacheuser
oc patch dc/demo-app --patch \    '{"spec":{"template":{"spec":{"serviceAccountName": "myserviceaccount"}}}}'

oc describe scc/restricted
oc describe scc/anyuid

RUN chgrp -R 0 directory && \    chmod -R g=u directory

#exes-onbuild-demo
EXPOSE 8080 
LABEL io.openshift.expose-services="8080:http
RUN sed -i "s/listen 80/listen 8080/g" /etc/nginx.conf
RUN chgrp -R 0 /var/opt/rh/rh-nginx18 && chmod -R g=u /var/opt/rh/rh-nginx18
#exes-

#exes-container-build
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

#exes-app-config 

 oc new-app --name myapp \    --build-env npm_config_registry=\ http://services.lab.example.com:8081/nexus/content/groups/nodejs \    http://services.lab.example.com/app-config 

oc set env bc/myapp --from configmap/myappconf 
$ oc set volume dc/myapp --add \    -t secret -m /opt/app-root/secure \    --name myappsec-vol --secret-name myappfilesec 
 oc rsh myapp-3-wzdbh env | grep APP_MSG 
#exes-


#exes-design-container
RUN chgrp -R 0 /opt/app-root && \ chmod -R g=u /opt/app-root 
USER 100

 git commit -a -m  'FIX'
 
 oc create configmap appconfig \    --from-literal APP_MSG="Elvis lives"
oc set env dc/hello --from configmap/appconfig
 oc rsh hello-3-ks1np env | grep APP_MSG 
  oc edit configmap/appconfig

#exes-

#exes-container-build

#exes-

RUN chgrp -R 0 /var/log/httpd /var/run/httpd && \    chmod -R g=u /var/log/httpd /var/run/httpd

oc new-app --name myapp  --code https://github.com/woyaowoyao/DO288-apps.git --context-dir=app-config
$ oc create configmap myappconf    --from-literal APP_MSG="Test Message" 
oc get -o yaml configmap/myappconf
oc describe configmap/myappconf 
oc create secret generic myappfilesec --from-file /home/student/app-config/myapp.sec 
oc create secret generic myappfilesec --from-file /root/redhat-do288/do288-apps/app-config/myapp.sec 
oc create secret generic secret_name \    --from-file /home/demo/mysecret.txt

oc create configmap config_map_name \    --from-literal key1=value1 \    --from-literal key
oc create configmap config_map_name \    --from-file /home/demo/conf.tx
oc set env dc/myapp \    --from configmap/myappconf
oc set volume dc/mydcname --add \    -t configmap -m /path/to/mount/volume \    --name myvol --configmap-name myconf
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

CHAPTE2-->

/etc/origin/node/node-config.yaml
 
《charpter3---
#pull下载
oc adm policy add-role-to-user system:registry developer 
#push上传
oc adm policy add-role-to-user system:image-builder developer

skopeo copy --dest-tls-verify=false \    --dest-creds=developer:$TOKEN \    oci:/home/student/DO288/labs/expose-registry/rhel7-info \    docker://docker-registry-default.apps.lab.example.com/common/rhel7-info
 grep INSECURE_REGISTRY \    ~/DO288/solutions/expose-registry/docker 
 # adding the registry to the INSECURE_REGISTRY line and uncommenting it. #INSECURE_REGISTRY='--insecure-registry registry.lab.example.com:5000' INSECURE_REGISTRY='--insecure-registry registry.lab.example.com:5000 --insecureregistry  docker-registry-default.apps.lab
  sudo cp ~/DO288/solutions/expose-registry/docker \    /etc/sysconfig/docker

 sudo systemctl status docker 
 oc import-image myis --confirm --insecure  --from registry.example.com:5000/myimage
 
#镜像导入到本地私有镜像仓库中--reference-policy='local'
oc import-image openshift/jenkins:v3.10 --reference-policy='local' --from=docker.io/openshift/jenkins-2-centos7:v3.10 --confirm
导入镜像时，referencePolicy.type默认为source。
oc import-image openshift/jenkins:v3.10 --from=docker.io/openshift/jenkins-2-centos7:v3.10 --confirm

#exes-image-stream
oc import-image hello-world --confirm \
 --from registry.lab.example.com:5000/hello-world-nginx --insecure
 
 docker login -u myuser -p $TOKEN docker-registry.default.svc:5000
docker pull xxxxx 
$ oc new-app --name hello -i common/hello-world
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


#exes-

charpter3---》

《charpter4---
#exes-manage-builds

oc new-app --name jhost --build-env MAVEN_MIRROR_URL=http://services.lab.example.com:8081/nexus/content/groups/training-java -i redhat-openjdk18-openshift http://services.lab.example.com/java-serverhost
 git clone http://services.lab.example.com/java-serverhost
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

&&&&--
oc login -u admin -p redhat  https://master.lab.example.com
oc login -u develper -p redhat  https://master.lab.example.com
oc describe build trigger-2 | grep cause

oc import-image php:latest -n openshift

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
@

@
#exes-

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

 @

@
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
charpter4---》

《charpter5---

charpter5---》


《charpter6---

charpter6---》


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
