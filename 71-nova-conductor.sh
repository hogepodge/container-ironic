# Starts the Nova Conductor service
docker run -d \
           --env-file ./config \
           --hostname nova-conductor \
           --name nova-conductor \
           --link=rabbitmq:rabbitmq \
           --link=mariadb:mariadb \
           nova-conductor:centos
