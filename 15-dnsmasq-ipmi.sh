# dnsmasq for the ipmi interfaces
docker run -d \
           --env-file ./config \
           --name dnsmasq-ipmi \
           -p 53:53 \
           -p 53:53/udp \
           --cap-add=NET_ADMIN \
           --net=host \
           dnsmasq:ipmi
