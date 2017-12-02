# Starts the Nova API service
docker run -d \
           --env-file ./config \
           --hostname nova-api \
           --name nova-api \
           --link=rabbitmq:rabbitmq \
           --link=mariadb:mariadb \
           -p=8774:8774 \
           -p=8775:8775 \
           nova-api:centos
