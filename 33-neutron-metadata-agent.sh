# Starts the Neutron Metadata Agent service
docker run -d \
           --env-file ./config \
           --hostname neutron-metadata-agent \
           --name neutron-metadata-agent \
           --cap-add=NET_ADMIN \
           --net=host \
           neutron-metadata-agent:centos 
