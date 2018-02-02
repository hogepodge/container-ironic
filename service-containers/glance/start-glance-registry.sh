#!/bin/bash
set -x

# Wait for Glance API to start
until $(curl --output /dev/null --silent --head http://${CONTROL_HOST_IP}:9292); do
    printf 'wait on Glance API'
    sleep 5
done

/initialize-glance.sh
glance-registry
