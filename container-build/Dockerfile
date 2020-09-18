# Use the httpd-parent image as base
FROM quay.io/redhattraining/httpd-parent
LABEL io.openshift.expose-services="8080:http"

RUN sed -i "s/listen 80/listen 8080/g" /etc/nginx.conf

RUN chgrp -R 0 /var/opt/rh/rh-nginx18 && chmod -R g=u /var/opt/rh/rh-nginx18

EXPOSE 8080 

# Run as the root user
USER 1001

# Launch apache daemon
CMD /usr/sbin/apachectl -DFOREGROUND