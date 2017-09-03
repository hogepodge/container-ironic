# Starts the Glance API service
docker run -d \
           --env-file ./config \
           --hostname glance-api \
           --name glance-api \
           --link=rabbitmq:rabbitmq \
           --link=mariadb:mariadb \
           -p=9292:9292 \
           glance-api:pike-centos
