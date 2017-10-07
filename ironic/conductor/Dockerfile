FROM ironic-base:centos
MAINTAINER chris@openstack.org
EXPOSE 3260
RUN yum install -y qemu-img ipmitool gettext ipmitool psmisc graphviz
ADD /start-ironic-conductor.sh /start-ironic-conductor.sh
ENTRYPOINT ["/start-ironic-conductor.sh"]
