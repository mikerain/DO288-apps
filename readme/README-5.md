
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

 

