#!/bin/bash
set -x
/initialize-glance.sh
# Wait for Glance API to start
until $(curl --output /dev/null --silent --head --insecure http://${CONTROL_HOST_IP}:9292); do
    printf 'wait on swift'
    sleep 5
done
glance-registry
