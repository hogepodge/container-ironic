FROM hogepodge/loci-neutron:pike-centos
MAINTAINER chris@openstack.org
EXPOSE 9696
RUN set -x \
    && yum upgrade -y \
    && yum install -y \
                   gcc \
                   python-devel \
                   wget \
                   curl \
                   mariadb \
                   which \
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
                   dnsmasq \
                   haproxy \
                   iproute \
                   git \
    && yum install -y epel-release \
    && yum install -y python-pip \
    && yum clean all \
    && pip install --upgrade pip \
    && pip install python-openstackclient
ADD /etc/neutron/ /etc/neutron/
ADD /generate.configs.sh /generate.configs.sh
ADD /generate.linuxbridge_agent.ini /generate.linuxbridge_agent.ini
ADD /generate.metadata_agent.ini /generate.metadata_agent.ini
ADD /generate.neutron.conf /generate.neutron.conf
ADD /initialize-keystone.sh /initialize-keystone.sh
ADD /initialize-neutron-database.sh /initialize-neutron-database.sh
ADD /initialize-provider-network.sh /initialize-provider-network.sh
ADD /start-neutron-dhcp-agent.sh /start-neutron-dhcp-agent.sh
ADD /start-neutron-metadata-agent.sh /start-neutron-metadata-agent.sh
ADD /start-neutron-linuxbridge-agent.sh /start-neutron-linuxbridge-agent.sh
ADD /start-neutron-server.sh /start-neutron-server.sh
ADD /wait-for-it.sh /wait-for-it.sh
ADD /neutron_sudoers /etc/sudoers.d/neutron_sudoers
RUN set -x \
    && chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/neutron_sudoers \
    && chown -R root:neutron /etc/neutron \
    && chown -R root:root /etc/neutron/rootwrap.d \
    && chmod 740 /etc/neutron/rootwrap.conf \
    && chmod -R 740 /etc/neutron/rootwrap.d
