# Starts the Glance API service
docker run -d \
           --env-file ./config \
           --hostname glance-registry \
           --name glance-registry \
           --link=rabbitmq:rabbitmq \
           --link=mariadb:mariadb \
           -p=9191:9191 \
           glance-registry:centos
