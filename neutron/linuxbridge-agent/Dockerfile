FROM neutron-base:pike-centos
MAINTAINER chris@openstack.org
RUN yum install -y iproute
ADD /start-neutron-linuxbridge-agent.sh /start-neutron-linuxbridge-agent.sh
ENTRYPOINT ["/start-neutron-linuxbridge-agent.sh"]
