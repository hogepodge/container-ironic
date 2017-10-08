docker run -v swiftconfig:/etc/swift \
           -v swiftdata:/srv/node \
           --net swiftnet \
           --ip 172.16.16.16 \
           --rm \
           -it \
           swift-base:centos \
           bash
