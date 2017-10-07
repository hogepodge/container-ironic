FROM neutron-base:centos
MAINTAINER chris@openstack.org
ADD /initialize-neutron-database.sh /initialize-neutron-database.sh
ADD /wait-for-it.sh /wait-for-it.sh
RUN yum install -y mariadb pip which
ENTRYPOINT ["/wait-for-it.sh", "mariadb:3306", "-t", "30", "--", "/initialize-neutron-database.sh"]
