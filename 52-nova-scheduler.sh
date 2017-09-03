# Starts the Nova API service
docker run -d \
           --env-file ./config \
           --hostname nova-scheduler \
           --name nova-scheduler \
           --link=rabbitmq:rabbitmq \
           --link=mariadb:mariadb \
           nova-scheduler:pike-centos
