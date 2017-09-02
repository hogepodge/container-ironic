# Starts the Keystone API service. Unique across the other services,
# this also does the keystone bootstrapping if necessary (since the
# operations provided by the Keystone developers to bootstrap are
# idempotent, and this won't lead to extra entries.
docker run -d \
           --env-file ./config \
           --hostname keystone \
           --name keystone \
           --link=rabbitmq:rabbitmq \
           --link=mariadb:mariadb \
           -p=5000:5000 -p=35357:35357  \
           keystone-api:pike-centos
           
