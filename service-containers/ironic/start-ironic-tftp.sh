#!/bin/bash
set -x

# Ironic 
until $(curl --output /dev/null --silent --head http://${CONTROL_HOST_IP}:6385); do
    printf 'Waiting on Ironic'
    sleep 5
done

#--secure \
/usr/sbin/in.tftpd \
    --foreground \
    --address 0.0.0.0:69 \
    -v -v -v -v \
    --map-file /imagedata/tftpboot/map-file \
    --user ironic \
    /imagedata/tftpboot
