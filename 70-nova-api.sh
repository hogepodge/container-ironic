# Starts the Nova API service
docker run -d \
           --env-file ./config \
           --hostname nova-api \
           --name nova-api \
           --link=rabbitmq:rabbitmq \
           --link=mariadb:mariadb \
           -p=8774:8774 \
           nova-api:centos
