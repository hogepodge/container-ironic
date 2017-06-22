# Starts the Ironic API service
docker run -d \
           --env-file ./config \
           --hostname ironic-api \
           --name ironic-api \
           --link=rabbitmq:rabbitmq \
           --link=mariadb:mariadb \
           -p=6385:6385 \
           ironic-api:centos
