# Starts the Neutron Server service
docker run -d \
           --env-file ./config \
           --hostname neutron-server \
           --name neutron-server \
           --link=rabbitmq:rabbitmq \
           --link=mariadb:mariadb \
           -p=9696:9696 \
           neutron-server:pike-centos
