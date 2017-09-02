# Starts the Ironic Conductor service
docker run -d \
           -v ironic-imagedata-volume:/imagedata \
           --env-file ./config \
           --hostname ironic-conductor \
           --name ironic-conductor \
           --link=rabbitmq:rabbitmq \
           --link=mariadb:mariadb \
           -p 3260:3260 \
           ironic-conductor:pike-centos
