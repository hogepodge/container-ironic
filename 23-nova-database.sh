# Initialize the ironic database
docker run --env-file ./config \
           --name initialize-nova-database \
           --link=mariadb:mariadb \
           --rm \
           nova-database:centos \
           -it bash
