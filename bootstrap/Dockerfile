FROM openstackclient:centos
ADD /wait-for-it.sh /wait-for-it.sh
ADD /initialize_service_catalog.sh /initialize_service_catalog.sh
ENTRYPOINT ["/wait-for-it.sh", "keystone_api:35357", "-t", "30", "--", "/initialize_service_catalog.sh"]
