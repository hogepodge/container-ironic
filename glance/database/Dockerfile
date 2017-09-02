FROM glance-base:pike-centos
MAINTAINER chris@openstack.org
ADD /initialize-glance-database.sh /initialize-glance-database.sh
ADD /wait-for-it.sh /wait-for-it.sh
RUN yum install -y mariadb pip
ENTRYPOINT ["/wait-for-it.sh", "mariadb:3306", "-t", "30", "--", "/initialize-glance-database.sh"]
