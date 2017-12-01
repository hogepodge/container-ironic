# Starts the iscsi daemon
docker run -d \
           -v /dev/disk:/dev/disk \
           --privileged \
           --net=host \
           --name ironic-iscsi \
           ironic-iscsi:centos 
