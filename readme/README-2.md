# Chapter2

# oc new-app https://github.com/woyaowoyao/DO288-apps.git --context-dir=todo-frontend-0 --name todo-frontend-0 #rhel7

# oc new-app https://github.com/woyaowoyao/DO288-apps.git --context-dir=todo-frontend --name todo-frontend  #ubi8

# oc new-app https://github.com/woyaowoyao/DO288-apps.git --context-dir=hello-java --name hello-java  #ubi8

# oc new-app https://github.com/woyaowoyao/DO288-apps.git --context-dir=apache-httpd --name apache-httpd #rhel7

do288-w\todo-frontend-0
docker pull  registry.access.redhat.com/rhscl/nodejs-6-rhel7


oc create serviceaccount apacheuser

oc login -u admin -p redhat https://master.lab.example.com

oc adm policy add-scc-to-user anyuid -z apacheuser

oc patch dc/demo-app --patch \    '{"spec":{"template":{"spec":{"serviceAccountName": "myserviceaccount"}}}}'

oc describe scc/restricted  oc describe scc/anyuid


#  RUN chgrp -R 0 directory && \    chmod -R g=u directory

# exes-onbuild-demo

# oc new-app https://github.com/woyaowoyao/DO288-apps.git --context-dir=onbuild-demo --name onbuild-demo

# oc new-app https://github.com/woyaowoyao/DO288-apps.git --context-dir=onbuild-demo-0 --name onbuild-demo-0
EXPOSE 8080 

LABEL io.openshift.expose-services="8080:http

RUN sed -i "s/listen 80/listen 8080/g" /etc/nginx.conf

RUN chgrp -R 0 /var/opt/rh/rh-nginx18 && chmod -R g=u /var/opt/rh/rh-nginx18

#exes-

# oc new-app https://github.com/woyaowoyao/DO288-apps.git --context-dir=hello-world-nginx --name hello-world-nginx

# [container-build]-start

git clone \    http://services.lab.example.com/container-build

oc new-project container-build

  oc new-app --name hello \    http://services.lab.example.com/container-build \    --insecure-registry 

# oc new-app https://github.com/woyaowoyao/DO288-apps.git --context-dir=container-build --name container-build#

# fix-1-start oc create serviceaccount apacheuse

oc login -u admin -p redhat  https://master.lab.example.com/

oc adm policy add-scc-to-user anyuid -z apacheuser

oc login -u developer -p redhat \    https://master.lab.example.com

oc edit dc/hell terminationGracePeriodSeconds: 30      

# fix-1-end serviceAccountName: apacheuse

# fix-2-start

 oc delete serviceaccount apacheuser 
 
RUN sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf

RUN chgrp -R 0 /var/log/httpd /var/run/httpd && \    chmod -R g=u /var/log/httpd /var/run/httpd

USER 1001

git commit -a -m "fix"

# oc new-app https://github.com/woyaowoyao/DO288-apps.git --context-dir=container-build-2 --name container-build2

oc delete project container-build

# [container-build]-end

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

oc new-app --name myap2 centos/nodejs-8-centos7~https://github.com/woyaowoyao/DO288-apps.git --context-dir=app-config

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

# oc new-app docker.io/sibdocker/openjdk18-openshift~https://github.com/woyaowoyao/DO288-apps.git --context-dir=todo-api-swarm --name todo-api-swarm
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
