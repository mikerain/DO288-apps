# s2i-do288-go
#FROM registry.lab.example.com:5000/rhel7:7.3
FROM registry.access.redhat.com/rhel7:7.3
MAINTAINER Red Hat Training <training@redhat.com>

# Generic labels
LABEL Component="go" \
      Name="s2i-do288-go" \
      Version="1.0" \
      Release="1"

# Labels consumed by OpenShift
LABEL io.k8s.description="A Go programming language S2I builder image" \
      io.k8s.display-name="Go programming language S2I builder image for DO288" \
      io.openshift.expose-services="8080:http" \
      io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"

# This label is used to categorize this image as a builder image in the
# OpenShift web console.
LABEL io.openshift.tags="builder, go, golang"

# The application folder
ENV APP_ROOT /opt/app-root

# Need this for installing golang RPM from classroom yum repo
ADD training.repo /etc/yum.repos.d/training.repo

# Install golang package
RUN   yum install -y --setopt=tsflags=nodocs --noplugins golang && \
      yum clean all --noplugins -y

# TODO: Place the S2I scripts in the correct location
COPY ./.s2i/bin/ /usr/libexec/s2i

# Permissions to run on OpenShift
RUN mkdir -p ${APP_ROOT} && \
    chown -R 1001:1001 ${APP_ROOT} && \
    chgrp -R 0 ${APP_ROOT} && \
    chmod -R g=u ${APP_ROOT}

# This default user is created in the rhel7 image
USER 1001

EXPOSE 8080

WORKDIR ${APP_ROOT}

CMD ["usage"]