# Starts the Neutron API service
docker run -d \
           --env-file ./config \
           --hostname neutron-api \
           --name neutron-api \
           --link=rabbitmq:rabbitmq \
           --link=mariadb:mariadb \
           -p=9696:9696 \
           neutron-api:pike-centos
