FROM neutron-base:centos
MAINTAINER chris@openstack.org
RUN yum install -y dnsmasq haproxy
ADD /start-neutron-dhcp-agent.sh /start-neutron-dhcp-agent.sh
ENTRYPOINT ["/start-neutron-dhcp-agent.sh"]
