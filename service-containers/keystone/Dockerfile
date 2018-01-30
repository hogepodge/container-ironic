FROM hogepodge/loci-keystone:pike-centos
MAINTAINER chris@openstack.org
RUN set -x \
    mkdir /etc/ssl \
    && yum upgrade -y \
    && yum install -y \
                   httpd \
                   mod_ssl \
                   mod_wsgi \
                   mariadb \
                   which; \
    yum clean all;
ADD /wait-for-it.sh /wait-for-it.sh
ADD /start-keystone-api.sh /start-keystone-api.sh
ADD /wsgi-keystone.conf /wsgi-keystone.conf
ADD /keystone-paste.ini /etc/keystone/keystone-paste.ini
ADD /generate.keystone.conf /generate.keystone.conf
ADD /generate.httpd.conf /generate.httpd.conf
