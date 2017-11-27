# Starts the Nova placement service
docker run -d \
           --env-file ./config \
           --hostname nova-placement \
           --name nova-placement \
           --link=rabbitmq:rabbitmq \
           --link=mariadb:mariadb \
           -p=8778:8000 \
           nova-placement:centos
