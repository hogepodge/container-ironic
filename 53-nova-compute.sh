# Starts the Nova Compute service
docker run -d \
           --env-file ./config \
           --hostname nova-compute \
           --name nova-compute \
           --link=rabbitmq:rabbitmq \
           --link=mariadb:mariadb \
           nova-compute:pike-centos
