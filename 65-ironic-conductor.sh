# Starts the Ironic Conductor service
docker run -d \
           -v ironic-imagedata-volume:/imagedata \
           -v /dev:/dev:rw \
           --env-file ./config \
           --hostname ironic-conductor \
           --name ironic-conductor \
           --privileged \
           --net=host \
           -p 3260:3260 \
           ironic-conductor:centos
