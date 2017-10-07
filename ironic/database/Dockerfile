FROM ironic-base:centos
MAINTAINER chris@openstack.org
ADD /initialize-ironic-database.sh /initialize-ironic-database.sh
ADD /wait-for-it.sh /wait-for-it.sh
RUN yum install -y mariadb pip which
ENTRYPOINT ["/wait-for-it.sh", "mariadb:3306", "-t", "30", "--", "/initialize-ironic-database.sh"]
