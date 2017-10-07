# Initialize the ironic database
docker run --env-file ./config \
           --name initialize-ironic-database \
           --link=mariadb:mariadb \
           --rm \
           ironic-database:centos
