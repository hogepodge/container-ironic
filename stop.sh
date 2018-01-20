docker stop \
            dnsmasq-ipmi \
            neutron-provider \
            nova-api \
            nova-scheduler \
            nova-conductor \
            nova-placement \
            nova-compute
           

docker rm \
          dnsmasq-ipmi \
          neutron-provider \
          nova-api \
          nova-scheduler \
          nova-conductor \
          nova-compute \
          nova-placement \
          service-endpoints

docker volume rm swiftconfig
docker volume rm swiftdata
