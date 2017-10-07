FROM openstack-client:centos
ADD /wait-for-it.sh /wait-for-it.sh
ADD /initialize-service-catalog.sh /initialize-service-catalog.sh
RUN yum install -y which
ENTRYPOINT ["/wait-for-it.sh", "keystone:35357", "-t", "30", "--", "/initialize-service-catalog.sh"]
