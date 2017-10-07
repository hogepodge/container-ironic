FROM neutron-base:centos
MAINTAINER chris@openstack.org
RUN yum install -y dnsmasq
ADD /start-neutron-dhcp-agent.sh /start-neutron-dhcp-agent.sh
ENTRYPOINT ["/start-neutron-dhcp-agent.sh"]
