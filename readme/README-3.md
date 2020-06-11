
# Charpter3

#pull下载

oc adm policy add-role-to-user system:registry developer 

#push上传

oc adm policy add-role-to-user system:image-builder developer

oc policy add-role-to-group -n img_project system:image-puller \    system:serviceaccounts:app_project

skopeo copy --dest-tls-verify=false \    --dest-creds=developer:$TOKEN \ 
  
oci:/home/student/DO288/labs/expose-registry/rhel7-info \    docker://docker-registry-default.apps.lab.example.com/common/rhel7-info
 
grep INSECURE_REGISTRY \    ~/DO288/solutions/expose-registry/docker 
 
 vi /etc/sysconfig/docker 

adding the registry to the INSECURE_REGISTRY line and uncommenting it. 
INSECURE_REGISTRY='--insecure-registry registry.lab.example.com:5000' INSECURE_REGISTRY='--insecure-registry registry.lab.example.com:5000 --insecureregistry  docker-registry-default.apps.lab
 
 INSECURE_REGISTRY='--insecure-registry registry.lab.example.com:5000 --insecure-registry docker-registry-default.apps.lab.example.com'

sudo cp ~/DO288/solutions/expose-registry/docker \    /etc/sysconfig/docker

sudo systemctl status docker 

sudo systemctl start docker 

oc import-image myis --confirm --insecure  --from registry.example.com:5000/myimage
 
#  oc import-image openjdk18-openshift --confirm --insecure --from docker.io/sibdocker/openjdk18

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

 # oc policy add-role-to-group system:image-puller system:serviceaccounts:expose-image
 
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

