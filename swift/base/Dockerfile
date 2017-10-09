FROM hogepodge/swift:centos
MAINTAINER chris@openstack.org
# Swift implementation taken from https://github.com/ccollicutt/docker-swift-onlyone
ADD /swift.conf /etc/swift/swift.conf
ADD /proxy-server.conf /etc/swift/proxy-server.conf
ADD /account-server.conf /etc/swift/account-server.conf
ADD /container-server.conf /etc/swift/container-server.conf
ADD /object-server.conf /etc/swift/object-server.conf
ADD /object-expirer.conf /etc/swict/object-expirer.conf
ADD /rsyncd.conf /etc/rsyncd.conf
ADD /supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD /start-service.sh /start-service.sh
RUN set -x \
    && mkdir -p /var/cache/swift \
    && chown -R root:swift /var/cache/swift \
    && chmod -R 775 /var/cache/swift \
    && yum upgrade -y \
    && yum install -y \
                   rsync \
                   liberasurecode \
                   memcached \
                   supervisor \
                   vim
