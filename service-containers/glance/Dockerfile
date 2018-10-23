FROM hogepodge/loci-glance:rocky-centos
MAINTAINER chris@openstack.org
RUN yum upgrade -y \
 && yum install -y \
                gcc \
                python-devel \
                wget \
                curl \
                mariadb \
                which; \
    yum install -y epel-release; \
    yum install -y python-pip; \
    yum clean all; \
    pip install --upgrade pip; \
    pip install python-openstackclient \
                python-swiftclient
ADD /generate.glance-api.conf /generate.glance-api.conf
ADD /generate.glance-registry.conf /generate.glance-registry.conf
ADD /generate.glance-swift.conf /generate.glance-swift.conf
ADD /glance-api-paste.ini /etc/glance/glance-api-paste.ini
ADD /glance-registry-paste.ini /etc/glance/glance-registry-paste.ini
ADD /start-glance-api.sh /start-glance-api.sh
ADD /start-glance-registry.sh /start-glance-registry.sh
ADD /initialize-keystone.sh /initialize-keystone.sh
ADD /initialize-glance-database.sh /initialize-glance-database.sh 
ADD /initialize-glance.sh /initialize-glance.sh
