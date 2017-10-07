# Starts the Nova Scheduler service
docker run -d \
           --env-file ./config \
           --hostname nova-scheduler \
           --name nova-scheduler \
           --link=rabbitmq:rabbitmq \
           --link=mariadb:mariadb \
           nova-scheduler:centos
