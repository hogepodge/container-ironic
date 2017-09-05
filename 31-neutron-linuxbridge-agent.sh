# Starts the Neutron Linuxbridge Agent service
docker run -d \
           --env-file ./config \
           --hostname neutron-linuxbridge-agent \
           --name neutron-linuxbridge-agent \
           --cap-add=NET_ADMIN \
           --net=host \
           neutron-linuxbridge-agent:pike-centos 
