docker stop rabbitmq \
            mariadb \
            keystone \
            neutron-api \
            neutron-linuxbridge-agent \
            glance-api\
            glance-registry \
            ironic-api \
            ironic-tftp \
            ironic-nginx \
            ironic-conductor \
            nova-api \
            nova-scheduler \
            nova-conductor \
            nova-compute
           

docker rm rabbitmq \
          mariadb \
          keystone \
          neutron-api \
          neutron-linuxbridge-agent \
          glance-api \
          glance-registry \
          ironic-api \
          ironic-conductor \
          ironic-tftp \
          ironic-nginx \
          nova-api \
          nova-scheduler \
          nova-conductor \
          nova-compute \
          service-endpoints

docker volume rm mariadb-volume

