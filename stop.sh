docker stop rabbitmq \
            mariadb \
            dnsmasq-ipmi \
            keystone \
            neutron-server \
            neutron-linuxbridge-agent \
            neutron-dhcp-agent \
            neutron-metadata-agent \
            neutron-provider \
            swift \
            glance-api\
            glance-registry \
            ironic-api \
            ironic-tftp \
            ironic-nginx \
            ironic-conductor \
            nova-api \
            nova-scheduler \
            nova-conductor \
            nova-placement \
            nova-compute
           

docker rm rabbitmq \
          mariadb \
          dnsmasq-ipmi \
          keystone \
          neutron-server \
          neutron-linuxbridge-agent \
          neutron-dhcp-agent \
          neutron-metadata-agent \
          neutron-provider \
          swift \
          glance-api \
          glance-registry \
          ironic-api \
          ironic-conductor \
          ironic-tftp \
          ironic-nginx \
          ironic-agent \
          nova-api \
          nova-scheduler \
          nova-conductor \
          nova-compute \
          nova-placement \
          service-endpoints

docker volume rm mariadb-volume
docker volume rm swiftconfig
docker volume rm swiftdata
