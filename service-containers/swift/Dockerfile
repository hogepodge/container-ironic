FROM hogepodge/loci-swift:rocky-centos
MAINTAINER chris@openstack.org
# Swift implementation taken from https://github.com/ccollicutt/docker-swift-onlyone
RUN set -x \
    yum upgrade -y \
    && yum install -y \
                   rsync \
                   liberasurecode \
                   memcached \
                   supervisor \
                   vim \
                   gcc \
                   python-devel \
                   wget \
                   curl \
                   which \
    && yum install -y epel-release \
    && yum install -y python-pip \
    && yum clean all \
    && pip install --upgrade pip \
    && pip install python-openstackclient \
    && pip install keystonemiddleware
ADD /generate.proxy-server.conf /generate.proxy-server.conf
ADD /initialize-keystone.sh /initialize-keystone.sh
ADD /start-service.sh /start-service.sh
ADD /account-server.conf /etc/swift/account-server.conf
ADD /container-server.conf /etc/swift/container-server.conf
ADD /object-expirer.conf /etc/swift/object-expirer.conf
ADD /object-server.conf /etc/swift/object-server.conf
ADD /rsyncd.conf /etc/rsyncd.conf
ADD /supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD /swift.conf /etc/swift/swift.conf
RUN set -x \
    && mkdir -p /var/cache/swift \
    && chown -R root:swift /var/cache/swift \
    && chmod -R 775 /var/cache/swift \
