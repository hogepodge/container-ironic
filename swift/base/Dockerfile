FROM hogepodge/swift:centos
MAINTAINER chris@openstack.org
ADD /generate.swift.conf /generate.swift.conf
ADD /generate.swift-proxy-server.conf /generate.swift-proxy-server.conf
ADD /generate.swift-account-server.conf /generate.swift-account-server.conf
ADD /generate.swift-container-server.conf /generate.swift-container-server.conf
ADD /generate.swift-object-server.conf /generate.swift-object-server.conf
ADD /generate.rsyncd.conf /generate.rsyncd.conf
ADD /generate.account-ring /generate.account-ring
ADD /generate.container-ring /generate.container-ring
ADD /generate.object-ring /generate.object-ring
ADD /configure-swift.sh /configure-swift.sh
ADD /start-service.sh /start-service.sh
#    && chown -R swift:swift /srv/node \
RUN set -x \
    && mkdir -p /var/cache/swift \
    && chown -R root:swift /var/cache/swift \
    && chmod -R 775 /var/cache/swift \
    && yum upgrade -y \
    && yum install -y \
                   rsync \
                   liberasurecode \
                   memcached
