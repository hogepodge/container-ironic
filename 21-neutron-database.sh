# Initialize the Neutron database
docker run --env-file ./config \
           --name initialize-neutron-database \
           --link=mariadb:mariadb \
           --rm \
           neutron-database:centos
