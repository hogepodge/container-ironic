# Starts the Neutron DHCP Agent service
docker run -d \
           --env-file ./config \
           --hostname neutron-dhcp-agent \
           --name neutron-dhcp-agent \
           --cap-add=NET_ADMIN \
           --cap-add=ALL \
           --net=host \
           neutron-dhcp-agent:centos 
