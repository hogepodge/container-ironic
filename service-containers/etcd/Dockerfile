FROM centos:7
MAINTAINER chris@openstack.org
RUN yum upgrade -y \
 && yum install -y etcd
ADD /start-etcd.sh /start-etcd.sh
