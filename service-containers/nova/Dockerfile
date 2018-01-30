FROM hogepodge/loci-nova:pike-centos
MAINTAINER chris@openstack.org
RUN yum upgrade -y \
    && yum install -y epel-release \
    && yum install -y \
        gcc \
        pythondevel \
        wget \
        curl \
        mariadb \
        iproute \
        libpython2.7 \
        libvirt0 \
        libxml2 \
        openvswitch \
        python-pip \
        which \
    && pip install --upgrade pip \
    && pip install python-ironicclient python-openstackclient
ADD /etc/nova/ /etc/nova/
ADD /generate.nova.conf /generate.nova.conf
ADD /nova_sudoers /etc/sudoers.d/nova_sudoers
ADD /initialize-keystone.sh /initialize-keystone.sh
ADD /initialize-nova-database.sh /initialize-nova-database.sh
ADD /start-nova-api.sh /start-nova-api.sh
ADD /start-nova-compute.sh /start-nova-compute.sh
ADD /start-nova-conductor.sh /start-nova-conductor.sh
ADD /start-nova-placement.sh /start-nova-placement.sh
ADD /start-nova-scheduler.sh /start-nova-scheduler.sh
ADD /wait-for-it.sh /wait-for-it.sh
RUN set -x \
    && chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/nova_sudoers \
    && chown -R root:nova /etc/nova \
    && chmod 740 /etc/nova/rootwrap.conf \
    && chmod -R 740 /etc/nova/rootwrap.d 
