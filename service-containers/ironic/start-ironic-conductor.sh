#!/bin/bash

# Ironic
until $(curl --output /dev/null --silent --head http://${CONTROL_HOST_IP}:6385); do
    printf '.'
    sleep 5
done

/generate.ironic.conf
ironic-conductor
