FROM nova-base:centos
MAINTAINER chris@openstack.org
RUN set -x \
    && yum upgrade -y \
    && yum install -y python-pip \
    && pip install python-ironicclient
ADD /start-nova-compute.sh /start-nova-compute.sh

ENTRYPOINT ["/start-nova-compute.sh"]
