# Initialize the glance database
docker run --env-file ./config \
           --name initialize-glance-database \
           --link=mariadb:mariadb \
           --rm \
           glance-database:pike-centos
