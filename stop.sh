docker stop rabbitmq \
            mariadb \
            keystone \
            neutron-server \
            neutron-linuxbridge-agent \
            neutron-dhcp-agent \
            neutron-metadata-agent \
            neutron-provider \
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
          neutron-server \
          neutron-linuxbridge-agent \
          neutron-dhcp-agent \
          neutron-metadata-agent \
          neutron-provider \
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

