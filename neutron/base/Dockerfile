FROM hogepodge/neutron:centos
MAINTAINER chris@openstack.org
ADD /etc/neutron/ /etc/neutron/
ADD /generate.neutron.conf /generate.neutron.conf
ADD /generate.linuxbridge_agent.ini /generate.linuxbridge_agent.ini
ADD /neutron_sudoers /etc/sudoers.d/neutron_sudoers
RUN set -x \
    && yum upgrade -y \
    && yum install -y git \
        bridge-utils \
        conntrack-tools \
        dnsmasq \
        dnsmasq-utils \
        ebtables \
        ipset \
        keepalived \
        libpython2.7 \
        libxml2 \
        openvswitch \
        uuid \
    && chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/neutron_sudoers \
    && chown -R root:neutron /etc/neutron \
    && chmod 740 /etc/neutron/rootwrap.conf \
    && chmod -R 740 /etc/neutron/rootwrap.d
