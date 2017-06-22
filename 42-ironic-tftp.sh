# Starts the tftp service, serving data from the previously initialized
# imagedata volume.
docker run -d \
           -v ironic-imagedata-volume:/imagedata \
           --name ironic-tftp \
           -p 69:69/udp \
           --rm \
           ironic-tftp:centos
