# Starts the Neutron Linuxbridge Agent service
docker run -d \
           --env-file ./config \
           --hostname neutron-linuxbridge-agent \
           --name neutron-linuxbridge-agent \
           --cap-add=ALL \
           --net=host \
           --privileged \
           neutron-linuxbridge-agent:centos 
