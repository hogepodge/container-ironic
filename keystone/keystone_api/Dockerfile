FROM keystone_base:centos
MAINTAINER chris@openstack.org
EXPOSE 5000
ADD /start_keystone_api.sh /start_keystone_api.sh
ADD /wsgi-keystone.conf /wsgi-keystone.conf
ADD /keystone-paste.ini /etc/keystone/keystone-paste.ini
RUN sudo yum install -y mariadb
ENTRYPOINT ["/start_keystone_api.sh"]
