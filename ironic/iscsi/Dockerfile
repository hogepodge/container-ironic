FROM centos:7
MAINTAINER chris@openstack.org
RUN yum update -y  \
 && yum install -y iscsi-initiator-utils \
 && groupadd -g 42424 ironic  \
 && useradd -u 42424 -g ironic -M -d /var/lib/ironic -s /usr/sbin/nologin -c "ironic user" ironic

ENTRYPOINT [ "/usr/sbin/iscsid", "-d", "8", "-f", "--pid=/run/iscsid.pid" ]
