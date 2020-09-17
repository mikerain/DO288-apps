
# Chapter5

[s2i-scripts]

sudo yum install source-to-image 

sudo docker pull registry.access.redhat.com/rhscl/httpd-24-rhel7:latest

# docker run --name test -it registry.access.redhat.com/rhscl/httpd-24-rhel7 bash

# cat /usr/libexec/s2i/assemble 

cat /usr/libexec/s2i/run 
cat /usr/libexec/s2i/usage 

sudo docker run --name test1 -it docker-registry.default.svc:5000/openshift/httpd bash

#work sudo oc import-image openshift/jenkins:v3.10 --from=docker.io/openshift/jenkins-2-centos7:v3.10 --confirm

sudo oc import-image openshift/jenkins:v3.10 --reference-policy='local' --from=docker.io/openshift/jenkins-2-centos7:v3.10 --confirm

sudo oc import-image rhscl/httpd-24-rhel7:latest --from registry.access.redhat.com/rhscl/httpd-24-rhel7:latest --confirm

sudo docker tag registry.access.redhat.com/rhscl/httpd-24-rhel7   docker-registry.default.svc:5000/httpd-24:latest

sudo docker tag registry.access.redhat.com/rhscl/httpd-24-rhel7   docker.io/robin9999/httpd-24:latest

sudo oc import-image my-httpd --from=docker.io/robin9999/httpd-24 --confirm

# sudo oc import-image httpd-24 --from registry.access.redhat.com/rhscl/httpd-24-rhel7:latest    --confirm --insecure=true

# sudo oc import-image docker-registry.default.svc:5000/openshift/httpd-24:latest --from registry.access.redhat.com/rhscl/httpd-24-rhel7:latest    --confirm --insecure=true

oc import-image sonatype/nexus-repository-manager --from=registry.connect.redhat.com/sonatype/nexus-repository-manager --confirm

oc import-image my-ruby --from=docker.io/openshift/ruby-20-centos7 --confirm

#work oc new-project do288-5

# oc new-app --name my2hello httpd-24~https://github.com/woyaowoyao/DO288-apps.git --context-dir=s2i-scripts

vi assemble
# @@@@考试
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

 oc new-app -i chapter5/hello --name hello2

 # oc new-app -i chapter5/my2hello2 --name my2hello2

 http://my2hello2-chapter5.apps.3e92.example.opentlc.com/info.html

[s2i-scripts]@@@@

skopeo delete --tls-verify=false \    docker://registry.lab.example.com:5000/s2i-do288-httpd

oc describe dc/mysql | grep -A 3 'Strategy:' 

[s2i build]

# s2i create s2i-do288-httpd s2i-do288-httpd

s2i create image_name director

docker build -t builder_image .

# @1 dockerfile 构建容器

# docker build -t s2i-do288-httpd .  

s2i build src builder_image tag_name

s2i build test/test-app s2i-do288-nginx nginx-test

# @2 tag到本地容器库

# docker tag s2i-do288-nginx  myregistry.example.com:5000/s2i-do288-nginx  

# @3 push

# docker push myregistry.example.com:5000/s2i-do288-nginx

# @4 导入 oc import-image s2i-do288-nginx --from myregistry.example.com:5000/s2i-do288-nginx --confirm --insecure=true

# @5 运行 oc new-app --name nginx-test    s2i-do288-nginx~git_repository

[s2i build]
docker tag ubijava8:1.0 docker-registry-default.apps.c918.example.opentlc.com:5000/ubijava8:1.0
docker push docker-registry-default.apps.c918.example.opentlc.com:5000/ubijava8:1.0

s2i-do288-httpd]-apache-s2i

docker build -t s2i-do288-httpd . 

s2i create s2i-do288-httpd s2i-do288-httpd

s2i build test/test-app/ \  s2i-do288-httpd s2i-sample-app 
  
[s2i-do288-httpd]
 
curl -s https://api.github.com/repos/openshift/source-to-image/releases/latest | grep browser_download_url 　| grep linux-amd64 　| cut -d '"' -f 4 | wget -qi -
curl -s  https://github-production-release-asset-2e65be.s3.amazonaws.com/16323162/6826d880-f1bd-11e9-8535-6d823d5af0bd?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20200321%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20200321T031222Z&X-Amz-Expires=300&X-Amz-Signature=9dd0e334ad0cbc4664d863900b075df1835fc9ff4389c04136da299006498a74&X-Amz-SignedHeaders=host&actor_id=9347028&response-content-disposition=attachment%3B%20filename%3Dsource-to-image-v1.2.0-2a579ecd-linux-amd64.tar.gz&response-content-type=application%2Foctet-stream
tree -a 
　 docker run --name test -u 1234    -p 8080:8080 -d s2i-sample-app 
#chapter5

# [custom-s2i] 本地构建docker镜像并且导入到osp 

cd custom-s2i

# docker build -t s2i-do288-go .

 # docker run --name go-test -u 1234 \    -p 8080:8080 -d s2i-go-app 

#  docker tag s2i-do288-go \    registry.lab.example.com:5000/s2i-do288-go

 # docker push \    registry.lab.example.com:5000/s2i-do288-go 

  # oc import-image s2i-do288-go \    --from registry.lab.example.com:5000/s2i-do288-go \    --confirm --insecure 

# oc new-app --name greet \    s2i-do288-go~http://services.lab.example.com/go-hello 

s2i 流程
https://docs.openshift.com/container-platform/3.11/creating_images/s2i.html#creating-images-s2i

# 重点-实验
PDF 202 ，数字页码 184，实验 自定义 s2i 脚本覆盖默认

1. 需要build 一个应用程序，这个应用程序的源码地址 http://services.lab.example.com/s2i-scripts

# sudo oc import-image httpd-24 --from registry.access.redhat.com/rhscl/httpd-24-rhel7:latest -n project-app3 --confirm --insecure=true

# oc new-app --name hello httpd-24~https://github.com/woyaowoyao/DO288-apps.git --context-dir=s2i-scripts

2. 这个源码中包含了自定义的 s2i 脚本 和 index.html 文件

3. 使用 rhscl/httpd-24-rhel7 builder image 构建 应用程序的时候，当应用程序构建完毕，
   当用户访问 http://app3.apps.lab.example.com的时候可以看到 Hello Class! DO288 rocks!!! 输出

4. 当应用构建完毕访问 http://app3.apps.lab.example.com/a.html 应该可以看到这些输出 
hello world httpd
2020-03-21  11:05 
03-21-2020  11:05（这个地方应该显示的是你构建应用程序的时间） 

5. 这个应用程序应该在 app3 project 中

6. 这个应用程序的名称 应该是 test3

docker inspect \    --format='{{ index .Config.Labels "io.openshift.s2i.scripts-url"}}' \    rhscl/php-70-rhel7 

skopeo inspect \    docker://myregistry.example.com/rhscl/php-70-rhel7 \    | grep io.openshift.s2i.scripts-url        


#!/bin/sh -e
# Stream the .m2 folder tar archive to stdout 
if [ -d ${HOME}/.m2 ]; then    pushd ${HOME} > /dev/null    tar cf - .m2    popd > /dev/null fi

# Restore the .m2 folder ...
 if [ -d /tmp/artifacts/.m2 ]; then  echo "---> Restoring maven artifacts..."  mv /tmp/artifacts/.m2 ${HOME}/ fi 
