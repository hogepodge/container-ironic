# Starts the Neutron DHCP Agent service
docker run -d \
           --env-file ./config \
           --hostname neutron-dhcp-agent \
           --name neutron-dhcp-agent \
           --cap-add=NET_ADMIN \
           --cap-add=ALL \
           --net=host \
           --sysctl net.ipv4.conf.all.promote_secondaries=1 \
           neutron-dhcp-agent:centos 
