# Starts the Swift service
docker run  \
           -v /dev/loop1:/dev/loop1 \
           --net swiftnet \
           --ip 172.16.16.16 \
           --env-file ./config \
           --hostname swift \
           --name swift \
           --privileged \
           -p=8888:8080 \
           --rm \
           -it \
           swift-base:centos \
           /bin/bash 
           #/start-service.sh
