#FROM registry.access.redhat.com/rhscl/nodejs-6-rhel7 
FROM registry.access.redhat.com/rhel7:7.3

RUN systemctl stop rhsmcertd.service   && systemctl disable rhsmcertd.service && systemctl status rhsmcertd.service && rpm -qa|grep subscription-manager  && rpm -qa|grep rhn && yum remove subscription-manager && yum remove rhn-check
USER 1001

CMD free -h



