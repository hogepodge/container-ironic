#!/bin/bash
/initialize-imagedata.sh
/initialize-ironic-database.sh
/initialize-keystone.sh
/generate.ironic.conf
# Ironic needs everything, so wait for everything

# Glance 
until $(curl --output /dev/null --silent --head http://${CONTROL_HOST_IP}:9292); do
    printf '.'
    sleep 5
done

# Swift 
until $(curl --output /dev/null --silent --head http://${CONTROL_HOST_IP}:8888); do
    printf '.'
    sleep 5
done

# Neutron
until $(curl --output /dev/null --silent --head http://${CONTROL_HOST_IP}:9696); do
    printf '.'
    sleep 5
done

/upload-agent.sh

ironic-api
