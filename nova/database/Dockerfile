FROM nova-base:centos
MAINTAINER chris@openstack.org
ADD /initialize-nova-database.sh /initialize-nova-database.sh
ADD /wait-for-it.sh /wait-for-it.sh
RUN yum install -y mariadb pip
ENTRYPOINT ["/wait-for-it.sh", "mariadb:3306", "-t", "30", "--", "/initialize-nova-database.sh"]
