#!/bin/bash
/generate.nova.conf
until $(curl --output /dev/null --silent --head http://${CONTROL_HOST_IP}:8774); do
    printf 'wait on Nova API'
    sleep 5
done
nova-scheduler
