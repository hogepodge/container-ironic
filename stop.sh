docker stop rabbitmq \
            mariadb \
            keystone \
            glance-api\
            glance-registry \
            ironic-api \
            ironic-tftp \
            ironic-nginx \
            ironic-conductor \
            nova-api \
            nova-scheduler \
            nova-conductor
           

docker rm rabbitmq \
          mariadb \
          keystone \
          glance-api \
          glance-registry \
          ironic-api \
          ironic-conductor \
          ironic-tftp \
          ironic-nginx \
          nova-api \
          nova-scheduler \
          nova-conductor \
          service-endpoints

docker volume rm mariadb-volume

