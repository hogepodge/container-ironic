# Starts the Swift service
docker run -d \
           -v /dev/loop1:/dev/loop1 \
           --net swiftnet \
           --ip 172.16.16.16 \
           --env-file ./config \
           --hostname swift \
           --name swift \
           --privileged \
           -p=8888:8080 \
           --rm \
           swift-base:centos 
