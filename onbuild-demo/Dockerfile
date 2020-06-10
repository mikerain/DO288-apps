#FROM  docker.io/centos/nginx-112-centos7:latest 
FROM registry.access.redhat.com/rhel7:7.3

RUN DISABLES="--disablerepo=rhel-server-extras --disablerepo=rhel-server --disablerepo=rhel-fast-datapath --disablerepo=rhel-server-optional --disablerepo=rhel-server-ose --disablerepo=rhel-server-rhscl" && \ 
   yum $DISABLES -y   nginx   && yum clean all

ADD index.html /usr/share/nginx/html

#ADD nginxconf.sed /tmp/
RUN sed -i -f /tmp/nginxconf.sed /etc/nginx/nginx.conf

RUN touch /run/nginx.pid \
  && chgrp -R 0 /var/log/nginx /run/nginx.pid #  && chmod -R g+rwx /var/log/nginx /run/nginx.pid
  
EXPOSE 8080
USER 1001

CMD nginx -g "daemon off;"



