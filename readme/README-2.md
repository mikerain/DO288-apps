# Chapter2

# oc new-app https://github.com/woyaowoyao/DO288-apps.git --context-dir=apache-httpd --name apache-httpd #rhel7

docker pull  registry.access.redhat.com/rhscl/nodejs-6-rhel7

cd DO288-apps-w/onbuild-demo/parent

# sudo docker build -t nginx-parent .

# 无法导入本地镜像 oc import-image nginx-parent --confirm  --from nginx-parent:latest -insecure 
 docker tag    nginx-parent:latest   docker-registry-default.apps.3e92.example.opentlc.com:5000/openshift/nginx-parent:latest 
 docker push docker-registry-default.apps.3e92.example.opentlc.com:5000/openshift/nginx-parent:latest

# 无法导入本地镜像-》解决方法wokwell
# oc new-app https://github.com/woyaowoyao/DO288-apps.git --context-dir=onbuild-demo/parent --name nginx-parent

oc create serviceaccount apacheuser

oc login -u admin -p redhat https://master.lab.example.com

oc adm policy add-scc-to-user anyuid -z apacheuser

oc patch dc/demo-app --patch \    '{"spec":{"template":{"spec":{"serviceAccountName": "myserviceaccount"}}}}'

oc describe scc/restricted  oc describe scc/anyuid

#  RUN chgrp -R 0 directory && \    chmod -R g=u directory

# [onbuild-demo]

# oc new-app https://github.com/woyaowoyao/DO288-apps.git --context-dir=onbuild-demo --name onbuild-demo

# oc new-app https://github.com/woyaowoyao/DO288-apps.git --context-dir=onbuild-demo-0 --name onbuild-demo-0
EXPOSE 8080 

LABEL io.openshift.expose-services="8080:http

RUN sed -i "s/listen 80/listen 8080/g" /etc/nginx.conf

RUN chgrp -R 0 /var/opt/rh/rh-nginx18 && chmod -R g=u /var/opt/rh/rh-nginx18

# oc new-app https://github.com/woyaowoyao/DO288-apps.git --context-dir=hello-world-nginx --name hello-world-nginx

# [container-build]-start

git clone \    http://services.lab.example.com/container-build

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
 
# RUN sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf

# RUN chgrp -R 0 /var/log/httpd /var/run/httpd && \    chmod -R g=u /var/log/httpd /var/run/httpd

USER 1001

git commit -a -m "fix"

# oc new-app https://github.com/woyaowoyao/DO288-apps.git --context-dir=container-build-2 --name container-build2

# oc new-app https://github.com/woyaowoyao/DO288-apps.git --context-dir=container-build-2 --name container-build3
oc delete project container-build

# [container-build]-en
 
oc get configmap/myconf -o json >myconf.json

# oc get configmap <configmap_name> -o json|yaml > <文件名>

oc edit configmap/myconf

oc delete configmap/myconf

oc patch configmap/myconf --patch \    '{"data":{"key1":"newvalue1"}}'

oc get secret/mysecret -o json

echo 'newpassword' | base64

oc edit secret/mysecret

# oc create secret generic secret_name \    --from-file /home/demo/mysecret.txt

# oc set env dc/mydcname   --from secret/mysecret
 
oc set volume dc/mydcname --add  -t secret -m /path/to/mount/volume \    --name myvol --secret-name mysecret

# oc set triggers dc/mydcname --from-config --remove

oc set triggers dc/mydcname --from-config

oc rollout latest mydcnam

 oc new-app --name myapp \    --build-env npm_config_registry=\ http://services.lab.example.com:8081/nexus/content/groups/nodejs \    http://services.lab.example.com/app-config 

oc set env bc/myapp --from configmap/myappconf 

$ oc set volume dc/myapp --add \    -t secret -m /opt/app-root/secure \    --name myappsec-vol --secret-name myappfilesec 

 oc rsh myapp-3-wzdbh env | grep APP_MSG 
 
# [app-config]-start workwll

# [design-container]

RUN chgrp -R 0 /opt/app-root && \ chmod -R g=u /opt/app-root 

USER 100

git commit -a -m  'FIX'
 
oc create configmap appconfig \    --from-literal APP_MSG="Elvis lives"

oc set env dc/hello --from configmap/appconfig

oc rsh hello-3-ks1np env | grep APP_MSG 

oc edit configmap/appconfig

RUN chgrp -R 0 /var/log/httpd /var/run/httpd && \    chmod -R g=u /var/log/httpd /var/run/httpd

# [app-config]

oc new-app --name myap2 centos/nodejs-8-centos7~https://github.com/woyaowoyao/DO288-apps.git --context-dir=app-config

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

oc rollout latest mydcname

[source-build]

oc new-project  source-build

# oc new-app https://github.com/woyaowoyao/DO288-apps.git --context-dir=nodejs-helloworld --name hello
 
 oc start-build --follow bc/hello 
 
#2020-0523-start 可运行

# oc new-app docker.io/sibdocker/openjdk18-openshift~https://github.com/woyaowoyao/DO288-apps.git --context-dir=todo-api-swarm --name todo-api-swarm

# opentlc_workwell oc new-app --strategy=source -i redhat-openjdk18-openshift:1.4 https://github.com/woyaowoyao/DO288-apps.git --context-dir=todo-api-swarm --name todo-api-swarm  #todo 需要设定数据库镜像变量

[hello-swarm]  

# design-container

hello-java && cd hello-java

oc new-project chapter2-hello-swarm-design-container

# oc new-app --name hellojava https://github.com/woyaowoyao/DO288-apps.git --context-dir=hello-java 

oc logs -f bc/hello

path= api/hello

http://hello-chapter2-hello-swarm-design-container.apps.e380.example.opentlc.com/api/hello

[hello-swarm]

# 重点：优化下面 Dockerfile，并满足以下要求： 重点实验
======================================================================

1. 请保证这个 Dockerfile 创建的容器尽量少的层

2. 请保证这个 Dockerfile 在 OpenShift 中可以 创建 pod 并保证 pod 正常执行

3. 当这个 Dockerfile 创建的 image 被其他用户 引用的时候，应该要执行 将 src 目录下的内容，拷贝到 /var/www/html 目录

# 重点： 创建一个应用程序，并且对这个应用程序进行变量注入，考试只需要对应用程序通过 configmap 注入变量，建议通过web console 创建，可以不用记命令

参考实验：PDF 102 页练习

请把用户自己创建的 configmap 导出为 cm.json | cm.yaml ；导出 cm 建议用命令行，防止评分脚本判定问题
oc get configmap <configmap_name> -o json|yaml > <文件名>

# oc new-app --name myap https://github.com/woyaowoyao/DO288-apps.git --context-dir=app-config

# oc create configmap myappconf    --from-literal APP_MSG="Test Message" 

# oc set env dc/hello --from cm/appconfig

# oc rsh hello-3-ks1np env | grep APP_MSG 

oc get -o yaml configmap/myappconf

oc describe configmap/myappconf 

oc create secret generic myappfilesec --from-file /root/redhat-do288/do288-apps/app-config/myapp.sec 

oc create configmap config_map_name \    --from-literal key1=value1 \    --from-literal key

oc create configmap config_map_name \    --from-file /home/demo/conf.tx

oc set env dc/myapp \    --from configmap/myappconf
oc set env dc/myap \    --from secret/myappfilesec
oc set volume dc/mydcname --add \    -t configmap -m /path/to/mount/volume \    --name myvol --configmap-name myconf

# oc set volume dc/myap --add -t secret -m /opt/app-root/secure --name myappsec-vol --secret-name myappfilesec 
 
oc set env dc/mydcname \    --from secret/mysecret

#暂停触发
oc set triggers dc/mydcname --from-config --remove

#启用触发
oc set triggers dc/mydcname --from-config

$ oc rollout latest dc/hello

#暂停触发
oc set triggers dc/mydcname --from-config --remove

#启用触发
oc set triggers dc/mydcname --from-config

oc rollout latest dc/hello
