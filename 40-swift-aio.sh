# Starts the Swift service
docker run  \
           -v swiftconfig:/etc/swift \
           -v swiftdata:/srv/node \
           --net swiftnet \
           --ip 172.16.16.16 \
           --env-file ./config \
           --hostname swift \
           --name swift \
           -p=8888:8888 \
           --rm \
           -it \
           swift-base:centos \
           /bin/bash 
           #/start-service.sh
