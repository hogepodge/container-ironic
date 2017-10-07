FROM hogepodge/keystone:centos
MAINTAINER chris@openstack.org
EXPOSE 5000 35357
ADD /wait-for-it.sh /wait-for-it.sh
ADD /start-keystone-api.sh /start-keystone-api.sh
ADD /wsgi-keystone.conf /wsgi-keystone.conf
ADD /keystone-paste.ini /etc/keystone/keystone-paste.ini
ADD /generate.keystone.conf /generate.keystone.conf
ADD /generate.httpd.conf /generate.httpd.conf
RUN set -x \
    && yum upgrade -y \
    && yum install -y \
                   httpd \
                   mod_ssl \
                   mod_wsgi \
                   mariadb \
                   which
ENTRYPOINT ["/wait-for-it.sh", "mariadb:3306", "-t", "30", "--", "/start-keystone-api.sh"]
