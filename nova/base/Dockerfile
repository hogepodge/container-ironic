FROM hogepodge/nova:centos
MAINTAINER chris@openstack.org
ADD /etc/nova/ /etc/nova/
ADD /generate.nova.conf /generate.nova.conf
ADD /nova_sudoers /etc/sudoers.d/nova_sudoers
RUN set -x \
    && chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/nova_sudoers \
    && chown -R root:nova /etc/nova \
    && chmod 740 /etc/nova/rootwrap.conf \
    && chmod -R 740 /etc/nova/rootwrap.d \
    && yum upgrade -y \
    && yum install -y \
        iproute \
        libpython2.7 \
        libvirt0 \
        libxml2 \
        openvswitch
