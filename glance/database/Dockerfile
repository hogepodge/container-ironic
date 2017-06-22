FROM glance_base:centos
MAINTAINER chris@openstack.org
ADD /initialize_glance_database.sh /initialize_glance_database.sh
ADD /wait-for-it.sh /wait-for-it.sh
RUN yum install -y mariadb pip; \
    pip install --upgrade pip; \
    pip install python-openstackclient
ENTRYPOINT ["/wait-for-it.sh", "mariadb:3306", "-t", "60", "--", "/initialize_glance_database.sh"]
