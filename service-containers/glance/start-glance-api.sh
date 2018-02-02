#!/bin/bash
set -x
/initialize-keystone.sh

# Wait for Swift to start
until $(curl --output /dev/null --silent --head  http://${CONTROL_HOST_IP}:8888); do
    printf 'wait on swift'
    sleep 5
done

/initialize-glance.sh

glance-api
