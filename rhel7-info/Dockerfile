FROM docker.io/centos/nginx-112-centos7
ADD info.sh /tmp
EXPOSE 8080
#RUN chgrp -R 0 /tmp/info.sh && chmod -R g=u /tmp/info.sh 
RUN chmod 755 /tmp/info.sh && sh /tmp/info.sh