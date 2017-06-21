FROM keystone_base:centos
MAINTAINER chris@openstack.org
EXPOSE 5000 35357
ADD /wait-for-it.sh /wait-for-it.sh
ADD /start_keystone_api.sh /start_keystone_api.sh
ADD /wsgi-keystone.conf /wsgi-keystone.conf
ADD /keystone-paste.ini /etc/keystone/keystone-paste.ini
RUN sudo yum install -y mariadb
ENTRYPOINT ["/wait-for-it.sh", "mariadb:3306", "-t", "30", "--", "/start_keystone_api.sh"]
