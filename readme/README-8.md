# Chapter8

cd camel-timer 

 # mvn fabric8:deploy 

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