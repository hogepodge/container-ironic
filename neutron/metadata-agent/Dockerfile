FROM neutron-base:pike-centos
MAINTAINER chris@openstack.org
RUN yum install -y dnsmasq
ADD /start-neutron-metadata-agent.sh /start-neutron-metadata-agent.sh
ENTRYPOINT ["/start-neutron-metadata-agent.sh"]
