#FROM registry.lab.example.com:5000/rhel7:7.3
FROM registry.access.redhat.com/rhel7.3

MAINTAINER Red Hat Training <training@redhat.com>

# Generic labels
LABEL Component="httpd" \
      Name="do288/httpd-parent" \
      Version="1.0" \
      Release="1"

# Labels consumed by OpenShift
LABEL io.k8s.description="A basic Apache HTTP Server image with ONBUILD instructions" \
      io.k8s.display-name="Apache HTTP Server parent image" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="apache, httpd"

# DocumentRoot for Apache
ENV DOCROOT=/var/www/html \
    LANG=en_US \
    LOG_PATH=/var/log/httpd

# Need this for installing Apache from classroom yum repo
ADD training.repo /etc/yum.repos.d/training.repo

RUN   yum install -y --disablerepo=base --disableplugin=subscription-manager --setopt=tsflags=nodocs --noplugins httpd && \
      yum clean all --disablerepo=base --disableplugin=subscription-manager --noplugins -y && \
      echo "Hello from the httpd-parent container!" > ${DOCROOT}/index.html 
 
 RUN   sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf 
 RUN   chgrp -R 0 /var/log/httpd /var/run/httpd && \    
       chmod -R g=u /var/log/httpd /var/run/httpd



# Allows child images to inject their own content into DocumentRoot
COPY src/ ${DOCROOT}/

EXPOSE 8080

# This stuff is needed to ensure a clean start
RUN rm -rf /run/httpd && mkdir /run/httpd

# Run as the root user
USER 1001

# Launch apache daemon
CMD /usr/sbin/apachectl -DFOREGROUND
