FROM centos:7
MAINTAINER chris@openstack.org
RUN yum upgrade -y
ADD calico.repo /etc/yum.repos.d/calico.repo
RUN yum install -y centos-release-openstack-queens
RUN yum install -y python-pip \
                   calico-control calico-dhcp-agent calico-compute \
                   bird bird6 \
 && pip install etcd3gw
