FROM docker.io/centos/nginx-112-centos7
ADD info.sh /tmp
RUN chgrp -R 0 /tmp/info.sh && chmod -R g=u /tmp/info.sh && sh /tmp/info.sh