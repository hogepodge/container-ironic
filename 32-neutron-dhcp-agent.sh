# Starts the Neutron DHCP Agent service
docker run -d \
           --env-file ./config \
           --hostname neutron-dhcp-agent \
           --name neutron-dhcp-agent \
           --cap-add=NET_ADMIN \
           --net=host \
           neutron-dhcp-agent:centos 
