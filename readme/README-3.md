
# Charpter3

export TOKEN=$(oc whoami -t)

oc adm policy add-role-to-user system:registry developer  #pull下载

oc adm policy add-role-to-user system:image-builder developer #push上传

oc policy add-role-to-group -n img_project system:image-puller \    system:serviceaccounts:app_project

skopeo copy --dest-tls-verify=false \    --dest-creds=developer:$TOKEN \ 
  oci:/home/student/DO288/labs/expose-registry/rhel7-info \    docker://docker-registry-default.apps.lab.example.com/common/rhel7-info
 
grep INSECURE_REGISTRY \    ~/DO288/solutions/expose-registry/docker 
 
 vi /etc/sysconfig/docker 

adding the registry to the INSECURE_REGISTRY line and uncommenting it. 
INSECURE_REGISTRY='--insecure-registry registry.lab.example.com:5000' INSECURE_REGISTRY='--insecure-registry registry.lab.example.com:5000 --insecureregistry  docker-registry-default.apps.lab
 
 INSECURE_REGISTRY='--insecure-registry registry.lab.example.com:5000 --insecure-registry docker-registry-default.apps.lab.example.com'

sudo cp ~/DO288/solutions/expose-registry/docker \    /etc/sysconfig/docker

oc import-image myis --confirm --insecure  --from registry.example.com:5000/myimage
 
#  oc import-image openjdk18-openshift --confirm --insecure --from docker.io/sibdocker/openjdk18

#镜像导入到本地私有镜像仓库中--reference-policy='local'

oc import-image openshift/jenkins:v3.10 --reference-policy='local' --from=docker.io/openshift/jenkins-2-centos7:v3.10 --confirm

导入镜像时，referencePolicy.type默认为source。

oc import-image openshift/jenkins:v3.10 --from=docker.io/openshift/jenkins-2-centos7:v3.10 --confirm

# oc adm policy add-role-to-user system:registry andrew
 
# oc adm policy add-role-to-user system:image-builder andrew

# 重点实验 oc import-image hello-world --confirm  --from registry.lab.example.com:5000/hello-world-nginx --insecure
 
 export TOKEN=$(oc whoami -t)

# docker login -u andrew -p $TOKEN docker-registry.default.svc:5000

docker pull xxxxx 

oc new-app --name hello -i common/hello-world

[expose-image]

oc login -u admin -p redhat  https://master.lab.example.com
 

#!/bin/bash

oc project default

oc adm policy add-role-to-user system:registry developer

oc adm policy add-role-to-user system:image-builder developer

oc login -u developer -p redhat https://master.lab.example.com

cat project-grant.sh

 # oc policy add-role-to-group system:image-puller system:serviceaccounts:expose-image #跨项目权限
 
cat registry-deny.sh 

oc login -u admin -p redhat
 
cat push-image.sh 
 
# skopeo copy --dest-tls-verify=false \
    --dest-creds=developer:$TOKEN \
    oci:/home/student/DO288/labs/expose-image/php-info \
    docker://docker-registry-default.apps.lab.example.com/common/php-info

# sudo yum install docker-distribution skopeo 
 
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
 
# Importance

# oc new-app --name hello-world-nginx  https://github.com/woyaowoyao/DO288-apps.git --context-dir=hello-world-nginx 

system:registry 

This role allows a user to pull images from the internal registry.

export TOKEN=$(oc whoami -t)

# docker login -u myuser -p $TOKEN docker-registry.default.svc:5000 #myregistry.example.com

oc policy add-role-to-group -n img_project system:image-puller \    system:serviceaccounts:app_project

docker rm $(docker ps -aq)

docker rmi -f $(docker images -aq)

oc import-image hello-world --confirm \    --from registry.lab.example.com:5000/hello-world-nginx --insecure 
 
# opentlc oc import-image hello-worldn --confirm --from  docker-registry.default.svc:5000/chapter3/hello-world-nginx --insecure 

# oc new-project image-stream

# oc policy add-role-to-group -n chapter3 system:image-puller    system:serviceaccounts:image-stream #赋予当前项目组有下载的权限

 # oc new-app --name hello -i chapter3/hello-worldn 

grep INSECURE_REGISTRY \    ~/DO288/solutions/expose-registry/docker 

sudo cp ~/DO288/solutions/expose-registry/docker \    /etc/sysconfig/docker

# 重点 ======================================================================

创建 image strem；重点实验 PDF 141 页=阿拉伯数字123页

1. 有一个xxx的源码，目前需要用户自己创建一个名为 myis 的image stream 

2. 这个 myis 的 image stream 应该包含 xxx 源码必要的运行环境

3. 当时用 myis 部署 xxx 源码的应用时，应该可以部署成功

4. 当应用部署成功之后，应该 传递 app1=100 的变量到应用程序中

docker-registry-cli <镜像仓库地址> list all < 如果是 https 需要加 ssl>          # 这个命令可以查看镜像仓库的所有镜像
oc import-image myis --confirm --from <镜像仓库地址>:5000/<镜像名称> --insecure # 找到对应的源码运行环境镜像，把这个镜像创建称为 image stream
oc new-app myis~<源码地址> #OpenShift 进行应用程序 build
最后一步，图形化创建 configmap 注入 应用程序
======================================================================