FROM docker.io/centos/nginx-112-centos7
ADD info.sh /tmp
#oc adm policy add-scc-to-user anyuid  -z default -n chapter1
USER root
RUN chgrp -R 0 /tmp/info.sh && chmod -R g=u /tmp/info.sh 
#RUN chmod 755 /tmp/info.sh && sh /tmp/info.sh